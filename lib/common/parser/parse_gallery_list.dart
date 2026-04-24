import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;

/// Parses a gallery list page (search / front / favorites) and returns a
/// `GallerySet` ready for the UI.
///
/// HTML parsing of search pages (~40 KB) and `querySelectorAll` walks were
/// historically the single largest source of UI thread stalls. We move the
/// pure-parse step to a worker isolate via `compute`, then enrich the
/// resulting Gallery objects with ObjectBox lookups on the main isolate
/// (since the ObjectBox `Store` cannot be shared across isolates).
Future<GallerySet> parseGalleryList(String html) async {
  final swParse = Stopwatch()..start();
  final raw = await compute(_parseGallerySetPure, html);
  swParse.stop();
  if (swParse.elapsedMilliseconds > 200) {
    logger.w(
      'parseGalleryList: pure parse on isolate took ${swParse.elapsedMilliseconds}ms (html ${html.length} bytes)',
    );
  }

  final swEnrich = Stopwatch()..start();
  final enriched = await _enrichGallerySet(raw);
  swEnrich.stop();
  if (swEnrich.elapsedMilliseconds > 200) {
    logger.w(
      'parseGalleryList: ObjectBox enrich took ${swEnrich.elapsedMilliseconds}ms',
    );
  }
  return enriched;
}

/// Top-level entrypoint suitable for `compute()`. Performs the HTML parse and
/// extracts every field we can derive without touching the local database.
/// Tags carried on each Gallery only have their `id` populated; the main
/// isolate fills `name` / `translatedName` afterwards.
GallerySet _parseGallerySetPure(String html) {
  final Document document = parse(html);

  const selectorScript = 'body > script';
  final scriptElm = document.querySelector(selectorScript);
  final scriptText = scriptElm?.text ?? '';

  final blacklistTags =
      RegExp(
        r'blacklisted_tags:\s+\[(.*)\],',
      ).firstMatch(scriptText)?.group(1) ??
      '';
  final blacklistTagsList = blacklistTags
      .split(',')
      .map((e) => e.trim().replaceAll("'", ''))
      .toList();

  // The new SvelteKit nhentai frontend wraps search results in
  // `.gallery-grid` while the homepage still uses the legacy
  // `.index-container` markup. Try both, in priority order.
  const selectorPopular =
      '#content > div.container.index-container.index-popular';
  const selectorGalleryListLegacy =
      '#content > div.container.index-container:not(.index-popular)';
  const selectorGalleryListSvelte = '.gallery-grid';
  const selectorFavoriteList = '#favcontainer';
  const selectorGallery = '.gallery:not(.blacklisted)';
  const selectorFavoriteGallery = '.gallery-favorite > .gallery';
  const selectorMaxPage = '.last';

  final Element? popularElm = document.querySelector(selectorPopular);
  final Element? galleryListElm =
      document.querySelector(selectorGalleryListLegacy) ??
      document.querySelector(selectorGalleryListSvelte);
  final Element? favoriteListElm = document.querySelector(selectorFavoriteList);

  final List<Element> galleryElmListOfPopular =
      popularElm?.querySelectorAll(selectorGallery) ?? [];
  final List<Element> galleryElmList =
      galleryListElm?.querySelectorAll(selectorGallery) ?? [];
  final List<Element> favoriteGalleryElmList =
      favoriteListElm?.querySelectorAll(selectorFavoriteGallery) ?? [];

  // The href can contain other digits (e.g. inside the `q=` UUID), so anchor
  // the match on the explicit `page=` query parameter.
  final lastHref =
      document.querySelector(selectorMaxPage)?.attributes['href'] ?? '';
  final maxPage =
      RegExp(r'[?&]page=(\d+)').firstMatch(lastHref)?.group(1) ??
      RegExp(r'\d+').firstMatch(lastHref)?.group(0) ??
      '1';

  final galleryList = _parseGalleryListElmPure(
    galleryElmList,
    blacklistTagsList,
  );
  final popularList = _parseGalleryListElmPure(
    galleryElmListOfPopular,
    blacklistTagsList,
  );
  final favoriteList = _parseGalleryListElmPure(favoriteGalleryElmList, []);

  return GallerySet(
    gallerys: galleryList,
    populars: popularList,
    favorites: favoriteList,
    maxPage: int.parse(maxPage),
  );
}

/// Pure version that runs inside the worker isolate. `simpleTags` only
/// contain raw nh tag ids; the main isolate enriches them later.
List<Gallery> _parseGalleryListElmPure(
  List<Element> galleryElmList,
  List<String> blacklistTagsList,
) {
  final List<Gallery> galleryList = [];
  for (final Element elm in galleryElmList) {
    final captionElm = elm.querySelector('.caption');

    final title = captionElm?.text ?? '';
    final url = elm.querySelector('.cover')?.attributes['href'] ?? '';
    // The current nhentai frontend uses native lazy loading: thumbnail URLs
    // live on `src`, with `data-src` no longer emitted. Fall back to `src`
    // when `data-src` is missing.
    final lazyloadElm = elm.querySelector('.lazyload');
    final thumbUrl =
        lazyloadElm?.attributes['data-src'] ??
        lazyloadElm?.attributes['src'] ??
        '';
    final imageHeight = int.tryParse(lazyloadElm?.attributes['height'] ?? '');
    final imageWidth = int.tryParse(lazyloadElm?.attributes['width'] ?? '');

    if (url.isEmpty) {
      continue;
    }

    final gid = RegExp(r'/(\d+)/').firstMatch(url)?.group(1) ?? '';
    final mediaId = RegExp(r'/(\d+)/').firstMatch(thumbUrl)?.group(1) ?? '';

    final ext = RegExp(r'\.(\w+)$').firstMatch(thumbUrl)?.group(1) ?? '';
    // type is a single-letter shorthand (`j`, `p`, `g`, `w`); default to `j`
    // when the URL has no extension we can read.
    final type = ext.isNotEmpty ? ext.substring(0, 1) : 'j';

    // The new SvelteKit frontend no longer emits `data-tags` on gallery
    // elements; the legacy frontend still does, so we keep this filter.
    final dataTags = (elm.attributes['data-tags'] ?? '')
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
    if (dataTags.isNotEmpty &&
        dataTags.any((e) => blacklistTagsList.contains(e))) {
      continue;
    }

    if (gid.isEmpty) {
      continue;
    }

    // simpleTags only carry the raw nh tag id at this stage; the main
    // isolate fills name / translatedName in `_enrichGallerySet`.
    final simpleTags = dataTags
        .map((t) => Tag(id: int.tryParse(t) ?? 0))
        .where((t) => t.id != 0)
        .toList();

    final Gallery gallery = Gallery(
      gid: int.parse(gid),
      mediaId: mediaId,
      languageCode: getLanguageCode(dataTags),
      simpleTags: simpleTags,
      title: GalleryTitle(englishTitle: title),
      images: GalleryImages(
        thumbnail: GalleryImage(
          type: type,
          imgHeight: imageHeight,
          imgWidth: imageWidth,
          // Preserve the exact thumbnail URL from the page so we don't have
          // to guess the filename suffix (now `thumb.jpg.webp`, `thumb.webp`,
          // etc., depending on the source format).
          imageUrl: thumbUrl.isNotEmpty ? thumbUrl : null,
        ),
      ),
    );
    galleryList.add(gallery);
  }
  return galleryList;
}

/// Fills in `name` / `translatedName` for every Gallery's `simpleTags`.
/// Yields back to the event loop periodically so very long lists don't
/// stall the UI.
Future<GallerySet> _enrichGallerySet(GallerySet raw) async {
  final enrichedMain = await _enrichGalleryList(raw.gallerys ?? const []);
  final enrichedPopular = await _enrichGalleryList(raw.populars ?? const []);
  final enrichedFav = await _enrichGalleryList(raw.favorites ?? const []);
  return raw.copyWith(
    gallerys: enrichedMain,
    populars: enrichedPopular,
    favorites: enrichedFav,
  );
}

Future<List<Gallery>> _enrichGalleryList(List<Gallery> list) async {
  if (list.isEmpty) {
    return list;
  }
  final result = <Gallery>[];
  for (var i = 0; i < list.length; i++) {
    final g = list[i];
    if (g.simpleTags.isEmpty) {
      result.add(g);
      continue;
    }
    final enrichedTags = <Tag>[];
    for (final t in g.simpleTags) {
      enrichedTags.add(_enrichSimpleTag(t));
    }
    result.add(g.copyWith(simpleTags: enrichedTags));
    // Every 5 galleries yield once, keeps frame budget reasonable even
    // for legacy pages that emit data-tags on every entry.
    if (i % 5 == 4) {
      await Future<void>.delayed(Duration.zero);
    }
  }
  return result;
}

Tag _enrichSimpleTag(Tag t) {
  final id = t.id ?? 0;
  if (id == 0) {
    return t;
  }
  final nhTag = objectBoxHelper.findNhTag(id);
  if (nhTag == null) {
    return t;
  }
  // findTagTranslate is an indexed equality lookup -> microsecond-fast.
  final translated = objectBoxHelper.findTagTranslate(
    nhTag.name ?? '',
    namespace: getTagNamespace(nhTag.type ?? ''),
  );
  return t.copyWith(
    name: nhTag.name,
    translatedName: translated?.translateNameNotMD ?? nhTag.name ?? '',
  );
}

String? getLanguageCode(List<String> tagIds) {
  if (tagIds.any((e) => e.trim() == '6346')) {
    return 'ja';
  } else if (tagIds.any((e) => e.trim() == '29963')) {
    return 'zh';
  } else if (tagIds.any((e) => e.trim() == '12227')) {
    return 'en';
  } else {
    return null;
  }
}

import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
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

/// Batch-enriches [simpleTags] for a list of galleries using two bulk DB
/// queries (one for NhTag names, one for translations). Safe to call from
/// any isolate that owns the DB store.
Future<List<Gallery>> enrichGalleryList(List<Gallery> list) =>
    _enrichGalleryList(list);

Future<List<Gallery>> _enrichGalleryList(List<Gallery> list) async {
  if (list.isEmpty) {
    return list;
  }

  final allIds = list
      .expand((g) => g.simpleTags)
      .map((t) => t.id ?? 0)
      .where((id) => id != 0)
      .toSet()
      .toList();
  if (allIds.isEmpty) {
    return list;
  }

  final nhTagMap = await objectBoxHelper.findNhTagsByIds(allIds);
  if (nhTagMap.isEmpty) {
    return list;
  }

  final names = nhTagMap.values
      .map((t) => t.name)
      .where((n) => n != null && n.isNotEmpty)
      .map((n) => n!)
      .toList();
  final translationMap = names.isNotEmpty
      ? await objectBoxHelper.findTagTranslatesByNames(names)
      : <String, dynamic>{};

  return list.map((g) {
    if (g.simpleTags.isEmpty) {
      return g;
    }
    final enrichedTags = g.simpleTags.map((t) {
      final id = t.id ?? 0;
      if (id == 0) {
        return t;
      }
      final nhTag = nhTagMap[id];
      if (nhTag == null) {
        return t;
      }
      final translated = translationMap[nhTag.name];
      return t.copyWith(
        name: nhTag.name,
        translatedName: translated?.translateNameNotMD ?? nhTag.name ?? '',
      );
    }).toList();
    return g.copyWith(simpleTags: enrichedTags);
  }).toList();
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

/// Maps a `GalleryListItem` JSON object (as returned by `/api/v2/galleries`,
/// `/api/v2/search`, `/api/v2/galleries/popular`, `/api/v2/favorites`) onto
/// our `Gallery` model.
///
/// The v2 list endpoints intentionally return only `tag_ids` (not full tag
/// objects), so we keep using the local ObjectBox `NhTag` table to look up
/// names / translations — same enrichment path the legacy HTML parser uses.
Gallery _galleryFromV2Json(Map<String, dynamic> json) {
  final tagIdsRaw = (json['tag_ids'] as List?) ?? const [];
  final tagIds = tagIdsRaw
      .map((e) => e is int ? e : int.tryParse(e.toString()) ?? 0)
      .where((e) => e != 0)
      .toList();

  final simpleTags = tagIds.map((id) => Tag(id: id)).toList();

  // v2 returns the thumbnail as a CDN-relative path (e.g.
  // `galleries/3903926/thumb.webp`); the legacy HTML scrape gave us the
  // absolute URL. Rebuild the absolute URL here so downstream image
  // loading keeps working without any caller-side knowledge of the CDN.
  final thumbnailRaw = (json['thumbnail'] as String?) ?? '';
  final thumbnailUrl = thumbnailRaw.isEmpty
      ? ''
      : (thumbnailRaw.startsWith('http')
            ? thumbnailRaw
            : 'https://t.nhentai.net/${thumbnailRaw.replaceFirst(RegExp(r'^/'), '')}');
  final ext = RegExp(r'\.(\w+)$').firstMatch(thumbnailUrl)?.group(1) ?? '';
  final type = ext.isNotEmpty ? ext.substring(0, 1) : 'j';

  return Gallery(
    gid: (json['id'] as num?)?.toInt() ?? 0,
    mediaId: json['media_id'] as String?,
    numPages: (json['num_pages'] as num?)?.toInt(),
    title: GalleryTitle(
      englishTitle: json['english_title'] as String?,
      japaneseTitle: json['japanese_title'] as String?,
    ),
    images: GalleryImages(
      thumbnail: GalleryImage(
        type: type,
        imgWidth: (json['thumbnail_width'] as num?)?.toInt(),
        imgHeight: (json['thumbnail_height'] as num?)?.toInt(),
        imageUrl: thumbnailUrl.isNotEmpty ? thumbnailUrl : null,
      ),
    ),
    languageCode: getLanguageCode(tagIds.map((e) => e.toString()).toList()),
    simpleTags: simpleTags,
  );
}

/// Optional resolver supplied by the caller (typically `request.dart`) to
/// fetch full `Tag` records for ids the local `NhTag` table doesn't know
/// yet. Kept as a typedef so the parser layer doesn't have to import the
/// network layer (which would create an import cycle).
typedef NhTagBackfillResolver = Future<List<Tag>> Function(List<int> ids);

/// Builds a `GallerySet` from the `PaginatedResponse[GalleryListItem]` shape
/// (`/api/v2/galleries`, `/api/v2/search`, `/api/v2/favorites`). `kind` picks
/// which slot of `GallerySet` the result list lands in.
///
/// When [backfill] is supplied, any tag id present in the response but
/// missing from the local `NhTag` table is fetched in bulk and learned
/// before enrichment, so the very first render of the list shows real
/// tag names instead of blanks.
Future<GallerySet> parseGalleryListV2(
  Map<String, dynamic> json, {
  GalleryListKind kind = GalleryListKind.gallerys,
  NhTagBackfillResolver? backfill,
}) async {
  final results = (json['result'] as List? ?? const [])
      .whereType<Map>()
      .where((e) => e['blacklisted'] != true)
      .map((e) => _galleryFromV2Json(e.cast<String, dynamic>()))
      .toList();
  final maxPage = (json['num_pages'] as num?)?.toInt() ?? 1;

  if (backfill != null) {
    await _backfillUnknownNhTags(results, backfill);
  }
  final enriched = await _enrichGalleryList(results);

  return GallerySet(
    gallerys: kind == GalleryListKind.gallerys ? enriched : null,
    populars: kind == GalleryListKind.populars ? enriched : null,
    favorites: kind == GalleryListKind.favorites ? enriched : null,
    maxPage: maxPage,
  );
}

/// Same idea as `parseGalleryListV2` but for endpoints that return a bare
/// JSON array (e.g. `/api/v2/galleries/popular`).
Future<GallerySet> parseGalleryListV2Array(
  List<dynamic> json, {
  GalleryListKind kind = GalleryListKind.populars,
  NhTagBackfillResolver? backfill,
}) async {
  final results = json
      .whereType<Map>()
      .where((e) => e['blacklisted'] != true)
      .map((e) => _galleryFromV2Json(e.cast<String, dynamic>()))
      .toList();
  if (backfill != null) {
    await _backfillUnknownNhTags(results, backfill);
  }
  final enriched = await _enrichGalleryList(results);
  return GallerySet(
    gallerys: kind == GalleryListKind.gallerys ? enriched : null,
    populars: kind == GalleryListKind.populars ? enriched : null,
    favorites: kind == GalleryListKind.favorites ? enriched : null,
    maxPage: 1,
  );
}

/// Walk the listing for every tag id that isn't in `NhTag` yet, ask the
/// caller-supplied resolver to fetch them in bulk, and feed the response
/// into `learnNhTags` so subsequent enrichment finds them. Failures are
/// swallowed: missing tag names are ugly but better than failing the
/// whole listing.
Future<void> _backfillUnknownNhTags(
  List<Gallery> galleries,
  NhTagBackfillResolver backfill,
) async {
  final allIds = galleries
      .expand((g) => g.simpleTags)
      .map((t) => t.id ?? 0)
      .where((id) => id != 0)
      .toSet()
      .toList();
  if (allIds.isEmpty) {
    return;
  }

  final known = await objectBoxHelper.findNhTagsByIds(allIds);
  final unknown = allIds.where((id) => !known.containsKey(id)).toList();
  if (unknown.isEmpty) {
    return;
  }

  try {
    final fetched = await backfill(unknown);
    if (fetched.isNotEmpty) {
      await objectBoxHelper.learnNhTags(fetched);
    }
  } catch (e) {
    logger.w('NhTag backfill failed (non-fatal): $e');
  }
}

enum GalleryListKind { gallerys, populars, favorites }

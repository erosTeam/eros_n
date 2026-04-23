import 'dart:async';

import 'package:collection/collection.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/parser/parse_gallery_list.dart' as listparse;
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart' hide Comment;
import 'package:html/parser.dart' show parse;
import 'package:tuple/tuple.dart';

/// Parses a gallery detail page (~80 KB HTML, ~30 tags) and returns the
/// fully-populated `Gallery`.
///
/// Detail HTML parsing dwarfed every other CPU spike on the main isolate,
/// so we offload the entire HTML walk to a worker via `compute`. The
/// returned object already carries every field that doesn't depend on the
/// local ObjectBox, and we enrich `tags.translatedName` / `simpleTags`
/// afterwards on the main isolate (which owns the ObjectBox `Store`).
Future<Gallery> parseGalleryDetail(String html) async {
  final swParse = Stopwatch()..start();
  final raw = await compute(_parseGalleryDetailPure, html);
  swParse.stop();
  if (swParse.elapsedMilliseconds > 200) {
    logger.w(
      'parseGalleryDetail: pure parse on isolate took ${swParse.elapsedMilliseconds}ms (html ${html.length} bytes)',
    );
  }

  final swEnrich = Stopwatch()..start();
  final enriched = await _enrichGalleryDetail(raw);
  swEnrich.stop();
  if (swEnrich.elapsedMilliseconds > 200) {
    logger.w(
      'parseGalleryDetail: ObjectBox enrich took ${swEnrich.elapsedMilliseconds}ms',
    );
  }

  // Passive learning: persist parsed tags into the local NhTag cache so
  // search autocomplete works without depending on an external prebuilt
  // tag dump. Fire-and-forget; failures here must not break detail load.
  unawaited(
    Future(() => objectBoxHelper.learnNhTags(enriched.tags)).catchError((
      Object e,
    ) {
      logger.w('learnNhTags failed: $e');
    }),
  );
  return enriched;
}

/// Top-level isolate-friendly parse. ObjectBox lookups happen on the main
/// isolate via `_enrichGalleryDetail`.
Gallery _parseGalleryDetailPure(String html) {
  final Document document = parse(html);

  const selectorScript = 'body > script';
  final scriptElm = document.querySelector(selectorScript);
  final scriptText = scriptElm?.text ?? '';

  final csrfToken =
      RegExp(r'csrf_token:\s+"(.*)",').firstMatch(scriptText)?.group(1) ?? '';

  final titleElms = document.querySelectorAll('#info > .title');
  final title = titleElms.firstOrNull?.text ?? '';
  final jpnTitle = titleElms.lastOrNull?.text ?? '';

  // The SvelteKit frontend renders the favorite button server-side without
  // any user-specific state — the button is always disabled, always uses
  // `fas fa-heart`, and shows "You need to log in" copy regardless of the
  // viewer's session. The favorite count *is* in the SSR markup though, so
  // we still scrape it from the button text.
  //
  // The actual "is favorited" state has to come from the API after parse
  // (see `getGalleryFavoriteStatus`).
  const selectorButtons = '#info > div.buttons';
  final buttonsElms = document.querySelector(selectorButtons);
  final favoriteButtonElm = buttonsElms?.children.firstOrNull;
  final favoriteText = favoriteButtonElm?.text.trim() ?? '';
  final favNum = RegExp(r'\d+').firstMatch(favoriteText)?.group(0) ?? '';

  const selectorMoreLikeGalleryList = '#related-container';
  const selectorGallery = '.gallery:not(.blacklisted)';
  final moreLikeGalleryElmList =
      document
          .querySelector(selectorMoreLikeGalleryList)
          ?.querySelectorAll(selectorGallery) ??
      [];
  // Reuse the listing parser so related galleries get the same shape;
  // their `simpleTags` are still raw ids (enrichment runs on the main
  // isolate).
  final moreLikeGalleryList = _parseGalleryListElmRaw(moreLikeGalleryElmList);

  const selectorThumb = '.gallerythumb';
  final List<Element> galleryThumbsElm = document.querySelectorAll(
    selectorThumb,
  );

  String? mediaId;

  final List<GalleryImage> galleryImagePages = [];
  for (final elm in galleryThumbsElm) {
    final href = elm.attributes['href'];
    final imgElm = elm.querySelector('img');
    // SvelteKit no longer lazy-loads via `data-src`; the real URL sits on
    // `src` directly. Keep `data-src` as a fallback for the legacy frontend.
    final thumbUrl =
        imgElm?.attributes['data-src'] ?? imgElm?.attributes['src'] ?? '';
    final imgHeight = int.tryParse(imgElm?.attributes['height'] ?? '');
    final imgWidth = int.tryParse(imgElm?.attributes['width'] ?? '');

    mediaId ??= RegExp(r'/galleries/(\d+)/').firstMatch(thumbUrl)?.group(1);

    // Filenames look like `1t.webp`, `2t.jpg.webp`, or even `4t.webp.webp`.
    // The first extension after the page-token marker is the original page
    // format (jpg/png/gif/webp); whatever comes after is just the cdn's
    // webp-transcoded variant. We need the original to derive the full-size
    // image URL (`{page}.{ext}`).
    final extMatch = RegExp(r'/\d+t\.([A-Za-z0-9]+)').firstMatch(thumbUrl);
    final ext = extMatch?.group(1) ?? 'webp';
    final type = ext.isNotEmpty ? ext.substring(0, 1) : 'w';

    galleryImagePages.add(
      GalleryImage(
        href: href,
        type: type,
        imgHeight: imgHeight,
        imgWidth: imgWidth,
        // Preserve the actual thumbnail URL so the thumb grid can render
        // without having to reverse-engineer the filename suffix.
        imageUrl: thumbUrl.isNotEmpty ? thumbUrl : null,
      ),
    );
  }

  final firstPage = galleryImagePages.firstOrNull;
  final thumbImage = GalleryImage(
    type: firstPage?.type ?? 'w',
    imgHeight: firstPage?.imgHeight,
    imgWidth: firstPage?.imgWidth,
  );

  final tuple = _parseGalleryTags(document);
  final tags = tuple.item1;
  final uploadedDateTime = tuple.item2;

  return Gallery(
    title: GalleryTitle(englishTitle: title, japaneseTitle: jpnTitle),
    images: GalleryImages(pages: galleryImagePages, thumbnail: thumbImage),
    mediaId: mediaId,
    // Initial favorited state is unknown — see comment above. The caller
    // refreshes it asynchronously via `getGalleryFavoriteStatus`.
    isFavorited: null,
    numFavorites: int.tryParse(favNum) ?? 0,
    moreLikeGallerys: moreLikeGalleryList,
    csrfToken: csrfToken,
    tags: tags,
    uploadedDateTime: uploadedDateTime,
  );
}

/// Mirrors `_parseGalleryListElmPure` from the listing parser. Kept private
/// to the detail file so we don't widen the listing parser's public API.
List<Gallery> _parseGalleryListElmRaw(List<Element> galleryElmList) {
  final List<Gallery> galleryList = [];
  for (final Element elm in galleryElmList) {
    final captionElm = elm.querySelector('.caption');
    final title = captionElm?.text ?? '';
    final url = elm.querySelector('.cover')?.attributes['href'] ?? '';
    final lazyloadElm = elm.querySelector('.lazyload');
    final thumbUrl =
        lazyloadElm?.attributes['data-src'] ??
        lazyloadElm?.attributes['src'] ??
        '';
    final imageHeight = int.tryParse(lazyloadElm?.attributes['height'] ?? '');
    final imageWidth = int.tryParse(lazyloadElm?.attributes['width'] ?? '');
    if (url.isEmpty) continue;

    final gid = RegExp(r'/(\d+)/').firstMatch(url)?.group(1) ?? '';
    final mediaId = RegExp(r'/(\d+)/').firstMatch(thumbUrl)?.group(1) ?? '';
    final ext = RegExp(r'\.(\w+)$').firstMatch(thumbUrl)?.group(1) ?? '';
    final type = ext.isNotEmpty ? ext.substring(0, 1) : 'j';

    final dataTags = (elm.attributes['data-tags'] ?? '')
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
    if (gid.isEmpty) continue;

    final simpleTags = dataTags
        .map((t) => Tag(id: int.tryParse(t) ?? 0))
        .where((t) => t.id != 0)
        .toList();

    galleryList.add(
      Gallery(
        gid: int.parse(gid),
        mediaId: mediaId,
        languageCode: listparse.getLanguageCode(dataTags),
        simpleTags: simpleTags,
        title: GalleryTitle(englishTitle: title),
        images: GalleryImages(
          thumbnail: GalleryImage(
            type: type,
            imgHeight: imageHeight,
            imgWidth: imageWidth,
            imageUrl: thumbUrl.isNotEmpty ? thumbUrl : null,
          ),
        ),
      ),
    );
  }
  return galleryList;
}

Tuple2<List<Tag>, String> _parseGalleryTags(Document document) {
  const selectorTagGroups = '#tags > .tag-container';

  String uploadedDateTime = '';

  final tagGroupsElm = document.querySelectorAll(selectorTagGroups);
  final tags = <Tag>[];
  for (final groupElm in tagGroupsElm) {
    final tagType = (groupElm.nodes.first.text?.trim() ?? '').replaceFirst(
      ':',
      '',
    );
    if (tagType == 'Uploaded') {
      uploadedDateTime =
          groupElm.querySelector('.nobold')?.attributes['datetime'] ?? '';
      continue;
    }

    if (tagType == 'Pages') continue;

    final tagElms = groupElm.querySelectorAll('.tag');
    for (final tagElm in tagElms) {
      final tagId = tagElm.className.trim().split(' ').last.split('-').last;
      final tagName = tagElm.querySelector('.name')?.text.trim() ?? '';
      final tagCount = tagElm.querySelector('.count')?.text.trim() ?? '';
      final tagUrl = tagElm.attributes['href'] ?? '';
      tags.add(
        Tag(
          id: int.tryParse(tagId) ?? 0,
          name: tagName,
          url: tagUrl,
          type: tagType,
          count: int.tryParse(tagCount) ?? 0,
        ),
      );
    }
  }
  return Tuple2(tags, uploadedDateTime);
}

/// Main-isolate enrichment: fills `translatedName` for every tag and the
/// `simpleTags` of every related gallery. Yields periodically to keep the
/// UI responsive during the (rare) cases where a detail page exposes many
/// related galleries.
Future<Gallery> _enrichGalleryDetail(Gallery raw) async {
  // Enrich top-level tags (translatedName).
  final enrichedTags = <Tag>[];
  for (var i = 0; i < raw.tags.length; i++) {
    final t = raw.tags[i];
    final translated = objectBoxHelper.findTagTranslate(
      t.name ?? '',
      namespace: getTagNamespace(t.type ?? ''),
    );
    enrichedTags.add(
      t.copyWith(
        translatedName: translated?.translateNameNotMD ?? t.name ?? '',
      ),
    );
    if (i % 8 == 7) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  // Enrich related galleries' simpleTags.
  final enrichedRelated = <Gallery>[];
  for (var i = 0; i < raw.moreLikeGallerys.length; i++) {
    final g = raw.moreLikeGallerys[i];
    if (g.simpleTags.isEmpty) {
      enrichedRelated.add(g);
      continue;
    }
    final tags = <Tag>[];
    for (final st in g.simpleTags) {
      final id = st.id ?? 0;
      if (id == 0) {
        tags.add(st);
        continue;
      }
      final nhTag = objectBoxHelper.findNhTag(id);
      if (nhTag == null) {
        tags.add(st);
        continue;
      }
      final translated = objectBoxHelper.findTagTranslate(
        nhTag.name ?? '',
        namespace: getTagNamespace(nhTag.type ?? ''),
      );
      tags.add(
        st.copyWith(
          name: nhTag.name,
          translatedName: translated?.translateNameNotMD ?? nhTag.name ?? '',
        ),
      );
    }
    enrichedRelated.add(g.copyWith(simpleTags: tags));
    if (i % 4 == 3) {
      await Future<void>.delayed(Duration.zero);
    }
  }

  return raw.copyWith(tags: enrichedTags, moreLikeGallerys: enrichedRelated);
}

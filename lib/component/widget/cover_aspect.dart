import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Cache of resolved cover aspect ratios keyed by thumbnail URL. Both the
/// waterfall card and the gallery detail header read from this so the Hero
/// source/target rectangles share the same shape; otherwise wide covers
/// visibly stretch during the fly because the source uses the real ratio
/// while the detail header falls back to a portrait guess.
final Map<String, double> coverAspectCache = <String, double>{};

/// Default ratio while we don't yet know the real cover size.
/// Most nhentai thumbnails are roughly portrait 3:4.
const double kFallbackCoverAspect = 3 / 4;

/// Resolves the cover aspect ratio from the cache, the listing-provided
/// hint, or the actual decoded image dimensions in that order. Updates the
/// shared cache (and the hook state) once the image stream resolves so the
/// value stays consistent across rebuilds and screens.
double useCoverAspectRatio(String? thumbUrl, {double? hint}) {
  final url = thumbUrl ?? '';
  final initial =
      coverAspectCache[url] ??
      ((hint != null && hint > 0) ? hint : kFallbackCoverAspect);
  final state = useState<double>(initial);

  useEffect(() {
    if (url.isEmpty) {
      return null;
    }
    final cached = coverAspectCache[url];
    if (cached != null) {
      if (state.value != cached) {
        state.value = cached;
      }
      return null;
    }
    final provider = getErosImageProvider(url);
    final stream = provider.resolve(const ImageConfiguration());
    late ImageStreamListener listener;
    listener = ImageStreamListener((ImageInfo info, bool _) {
      final w = info.image.width;
      final h = info.image.height;
      if (w > 0 && h > 0) {
        final ratio = w / h;
        coverAspectCache[url] = ratio;
        if (state.value != ratio) {
          state.value = ratio;
        }
      }
      stream.removeListener(listener);
    }, onError: (_, _) => stream.removeListener(listener));
    stream.addListener(listener);
    return () => stream.removeListener(listener);
  }, [url]);

  return state.value;
}

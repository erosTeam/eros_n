enum GalleryFetchMode { html, api, autoFallback }

/// Code-level switch for gallery detail fetch strategy.
/// html         - scrape HTML page (provides csrfToken, may be CF-blocked)
/// api          - JSON API only (no CF block, csrfToken sourced from cookie)
/// autoFallback - try HTML first, fall back to API on CF 403
const GalleryFetchMode kGalleryFetchMode = GalleryFetchMode.autoFallback;

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(date) => "Added ${date}";

  static String m1(total, galleries, pages) =>
      "Total concurrent requests: ${total} (${galleries} × ${pages}). Very likely to trigger a temporary CDN ban, causing download failures and broken thumbnails. Reduce concurrency.";

  static String m2(total, galleries, pages) =>
      "Total concurrent requests: ${total} (${galleries} × ${pages}). This may trigger CDN rate limiting during bulk downloads. Reduce concurrency if downloads fail.";

  static String m3(downloaded, total) => "${downloaded} / ${total} pages";

  static String m4(count) => "${count} pages";

  static String m5(error) => "Failed to update favorite: ${error}";

  static String m6(version) =>
      "need download tag translation data, version: ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("Advanced"),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "always": MessageLookupByLibrary.simpleMessage("Always"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "author": MessageLookupByLibrary.simpleMessage("Author"),
    "auto": MessageLookupByLibrary.simpleMessage("Auto"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage(
      "Auto read interval",
    ),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("Calculating..."),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("Chinese"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("Clear Cache"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Clear all cached data? (HTTP responses, images)",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("Clear History"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "Are you sure to clear all history?",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "Clear all search history?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage(
      "Clipboard link detection",
    ),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "Comment must be longer than 10 characters",
    ),
    "comments": MessageLookupByLibrary.simpleMessage("Comments"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage(
      "Concurrent Downloads",
    ),
    "cover_blur": MessageLookupByLibrary.simpleMessage("Cover Blur"),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("Curl Vertical"),
    "current_path": MessageLookupByLibrary.simpleMessage("Current path"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage(
      "Custom Layout Width",
    ),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "display": MessageLookupByLibrary.simpleMessage("Display"),
    "download": MessageLookupByLibrary.simpleMessage("Download"),
    "download_completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "This will delete the task record and all downloaded files. Continue?",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "Delete Download",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage("Download Failed"),
    "download_management": MessageLookupByLibrary.simpleMessage("Downloads"),
    "download_path": MessageLookupByLibrary.simpleMessage("Download Path"),
    "download_paused": MessageLookupByLibrary.simpleMessage("Paused"),
    "download_pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage("Re-download"),
    "download_settings": MessageLookupByLibrary.simpleMessage(
      "Download Settings",
    ),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("Downloading"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("Dynamic Color"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage(
      "Color will change according to the wallpaper",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "favorite_added": MessageLookupByLibrary.simpleMessage(
      "Added to favorites",
    ),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage(
      "Removed from favorites",
    ),
    "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
    "full_screen": MessageLookupByLibrary.simpleMessage("Full Screen"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "grid": MessageLookupByLibrary.simpleMessage("Grid"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "Hide Bottom Navigation on Scroll",
    ),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "japanese": MessageLookupByLibrary.simpleMessage("Japanese"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "language_name": MessageLookupByLibrary.simpleMessage("English"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("Left to Right"),
    "license": MessageLookupByLibrary.simpleMessage("License"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("Liquid Glass"),
    "list": MessageLookupByLibrary.simpleMessage("List"),
    "list_model": MessageLookupByLibrary.simpleMessage("List Model"),
    "list_style": MessageLookupByLibrary.simpleMessage("List Style"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "login_by_web": MessageLookupByLibrary.simpleMessage("Login by Web"),
    "login_invalid": MessageLookupByLibrary.simpleMessage("Login invalid"),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "Login need captcha",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "Simultaneous galleries",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage(
      "Pages per gallery",
    ),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("More like this"),
    "never": MessageLookupByLibrary.simpleMessage("Never"),
    "newest": MessageLookupByLibrary.simpleMessage("Newest"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("No Downloads"),
    "no_result": MessageLookupByLibrary.simpleMessage("No Results"),
    "none": MessageLookupByLibrary.simpleMessage("None"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("Open in Browser"),
    "open_supported_links": MessageLookupByLibrary.simpleMessage(
      "Open supported links",
    ),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "Starting with Android 12, apps can only be used as web link handling apps if they are approved. Otherwise it will be processed using the default browser. You can manually approve it here",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "You can also pinch to adjust on the page",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage(
      "Please login first",
    ),
    "please_login_web": MessageLookupByLibrary.simpleMessage(
      "Please login with web",
    ),
    "popular": MessageLookupByLibrary.simpleMessage("Popular"),
    "popular_all": MessageLookupByLibrary.simpleMessage("Popular All"),
    "popular_month": MessageLookupByLibrary.simpleMessage("Popular Month"),
    "popular_today": MessageLookupByLibrary.simpleMessage("Popular Today"),
    "popular_week": MessageLookupByLibrary.simpleMessage("Popular Week"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage(
      "Preload pages count",
    ),
    "read": MessageLookupByLibrary.simpleMessage("Read"),
    "read_model": MessageLookupByLibrary.simpleMessage("Read Model"),
    "recent": MessageLookupByLibrary.simpleMessage("Recent"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("Recent searches"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "reset_to_default": MessageLookupByLibrary.simpleMessage(
      "Reset to default",
    ),
    "resume": MessageLookupByLibrary.simpleMessage("Resume"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("Right to Left"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "share": MessageLookupByLibrary.simpleMessage("Share"),
    "show_less": MessageLookupByLibrary.simpleMessage("Showing less"),
    "show_more": MessageLookupByLibrary.simpleMessage("Showing more"),
    "show_tags": MessageLookupByLibrary.simpleMessage("Show Tags"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "Show tags in list, need download tags data",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("Single Line"),
    "sort_by": MessageLookupByLibrary.simpleMessage("Sort by"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage("Date (Newest)"),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage("Date (Oldest)"),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("Title (A–Z)"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("Title (Z–A)"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "tag": MessageLookupByLibrary.simpleMessage("Tag"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage(
      "Tag Layout on Item",
    ),
    "tag_translation": MessageLookupByLibrary.simpleMessage("Tag Translation"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "Translation data update failed",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "Translation data updated",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "Downloading translation data...",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("Artists"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("Characters"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("Groups"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("Languages"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("Parodies"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("Tags"),
    "tags_data": MessageLookupByLibrary.simpleMessage("Tags Data"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
    "thumbs": MessageLookupByLibrary.simpleMessage("Thumbs"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "translated": MessageLookupByLibrary.simpleMessage("Translated"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage(
      "Use Gallery Tint",
    ),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "Tint gallery pages base on the color of the cover",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "vertical": MessageLookupByLibrary.simpleMessage("Vertical"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage(
      "Volume key to turn page",
    ),
    "waterfall": MessageLookupByLibrary.simpleMessage("Waterfall Flow"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage(
      "Waterfall Flow (Compact)",
    ),
    "webtoon": MessageLookupByLibrary.simpleMessage("Webtoon"),
    "wrap": MessageLookupByLibrary.simpleMessage("Wrap"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
  };
}

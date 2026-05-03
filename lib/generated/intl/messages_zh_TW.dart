// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
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
  String get localeName => 'zh_TW';

  static String m0(date) => "加入於 ${date}";

  static String m1(total, galleries, pages) =>
      "總同時請求數：${total}（${galleries} × ${pages}）。極有可能觸發 CDN 暫時封鎖，導致下載失敗及縮圖無法顯示。請降低同時下載數。";

  static String m2(total, galleries, pages) =>
      "總同時請求數：${total}（${galleries} × ${pages}）。批次下載時可能觸發 CDN 速率限制。如果下載失敗，請降低同時下載數。";

  static String m3(downloaded, total) => "${downloaded} / ${total} 頁";

  static String m4(count) => "${count} 頁";

  static String m5(error) => "更新收藏失敗：${error}";

  static String m6(version) => "需要下載標籤翻譯資料，版本：${version}";

  static String m7(count) => "已快取 ${count} 筆翻譯";

  static String m8(kind) => "WebView 已請求 \'\'${kind}\'\' 權限";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("關於"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("進階"),
    "all": MessageLookupByLibrary.simpleMessage("全部"),
    "allow": MessageLookupByLibrary.simpleMessage("允許"),
    "always": MessageLookupByLibrary.simpleMessage("總是"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("外觀"),
    "author": MessageLookupByLibrary.simpleMessage("作者"),
    "auto": MessageLookupByLibrary.simpleMessage("自動"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage("自動閱讀間隔"),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage("自動翻譯留言"),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("雙語顯示"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "這是翻譯後的留言文字。",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage("雙語樣式"),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage("緊湊"),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage("分隔線"),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage("淡化斜體"),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("計算中⋯"),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("中文"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("清除快取"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "清除所有快取資料？（HTTP 回應、圖片）",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("清除歷史"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage("確定要清除所有歷史紀錄嗎？"),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "清除所有搜尋紀錄？",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage("清除翻譯快取"),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "清除所有已快取的翻譯？",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage("剪貼簿連結偵測"),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "留言必須超過 10 個字元",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage("留言翻譯"),
    "comments": MessageLookupByLibrary.simpleMessage("留言"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage("同時下載數"),
    "cover_blur": MessageLookupByLibrary.simpleMessage("封面模糊"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage("模糊列表中的封面圖片"),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("翻頁直式"),
    "current_path": MessageLookupByLibrary.simpleMessage("目前路徑"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage("自訂版面寬度"),
    "custom_provider": MessageLookupByLibrary.simpleMessage("自訂"),
    "dark": MessageLookupByLibrary.simpleMessage("深色"),
    "delete": MessageLookupByLibrary.simpleMessage("刪除"),
    "deny": MessageLookupByLibrary.simpleMessage("拒絕"),
    "display": MessageLookupByLibrary.simpleMessage("顯示"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage("再按一次返回以退出"),
    "download": MessageLookupByLibrary.simpleMessage("下載"),
    "download_completed": MessageLookupByLibrary.simpleMessage("已完成"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "這將刪除任務紀錄及所有已下載的檔案。是否繼續？",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "刪除下載",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage("下載失敗"),
    "download_management": MessageLookupByLibrary.simpleMessage("下載管理"),
    "download_path": MessageLookupByLibrary.simpleMessage("下載路徑"),
    "download_paused": MessageLookupByLibrary.simpleMessage("已暫停"),
    "download_pending": MessageLookupByLibrary.simpleMessage("等待中"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage("重新下載"),
    "download_settings": MessageLookupByLibrary.simpleMessage("下載設定"),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("下載中"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("動態色彩"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage("顏色會根據桌布自動變化"),
    "english": MessageLookupByLibrary.simpleMessage("英文"),
    "favorite_added": MessageLookupByLibrary.simpleMessage("已加入收藏"),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage("已移除收藏"),
    "favorites": MessageLookupByLibrary.simpleMessage("收藏"),
    "fetch_models": MessageLookupByLibrary.simpleMessage("取得模型列表"),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage("取得模型列表失敗"),
    "full_screen": MessageLookupByLibrary.simpleMessage("全螢幕"),
    "gallery": MessageLookupByLibrary.simpleMessage("圖庫"),
    "general": MessageLookupByLibrary.simpleMessage("一般"),
    "grid": MessageLookupByLibrary.simpleMessage("網格"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "滑動時隱藏底部導覽列",
    ),
    "history": MessageLookupByLibrary.simpleMessage("歷史"),
    "home": MessageLookupByLibrary.simpleMessage("首頁"),
    "japanese": MessageLookupByLibrary.simpleMessage("日文"),
    "language": MessageLookupByLibrary.simpleMessage("語言"),
    "language_name": MessageLookupByLibrary.simpleMessage("繁體中文"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("從左到右"),
    "license": MessageLookupByLibrary.simpleMessage("授權條款"),
    "light": MessageLookupByLibrary.simpleMessage("淺色"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("液態玻璃"),
    "list": MessageLookupByLibrary.simpleMessage("列表"),
    "list_model": MessageLookupByLibrary.simpleMessage("列表模式"),
    "list_style": MessageLookupByLibrary.simpleMessage("列表樣式"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage("載入更多失敗"),
    "login": MessageLookupByLibrary.simpleMessage("登入"),
    "login_by_web": MessageLookupByLibrary.simpleMessage("透過網頁登入"),
    "login_invalid": MessageLookupByLibrary.simpleMessage("登入無效"),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage("登入需要驗證碼"),
    "logout": MessageLookupByLibrary.simpleMessage("登出"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage("確定要登出嗎？"),
    "manual_input": MessageLookupByLibrary.simpleMessage("手動輸入"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage("同時下載圖庫數"),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage("每個圖庫同時下載頁數"),
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("類似作品"),
    "never": MessageLookupByLibrary.simpleMessage("從不"),
    "newest": MessageLookupByLibrary.simpleMessage("最新"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("沒有下載項目"),
    "no_result": MessageLookupByLibrary.simpleMessage("沒有結果"),
    "none": MessageLookupByLibrary.simpleMessage("無"),
    "not_initialized": MessageLookupByLibrary.simpleMessage("尚未初始化"),
    "ok": MessageLookupByLibrary.simpleMessage("確定"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("在瀏覽器中開啟"),
    "open_supported_links": MessageLookupByLibrary.simpleMessage("開啟支援的連結"),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "從 Android 12 開始，應用程式只有在獲得核准後才能作為網頁連結處理程式。否則將由預設瀏覽器處理。您可以在這裡手動核准",
    ),
    "password": MessageLookupByLibrary.simpleMessage("密碼"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "也可以在頁面上用雙指縮放來調整",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage("請先登入"),
    "please_login_web": MessageLookupByLibrary.simpleMessage("請透過網頁登入"),
    "popular": MessageLookupByLibrary.simpleMessage("熱門"),
    "popular_all": MessageLookupByLibrary.simpleMessage("所有熱門"),
    "popular_month": MessageLookupByLibrary.simpleMessage("本月熱門"),
    "popular_today": MessageLookupByLibrary.simpleMessage("今日熱門"),
    "popular_week": MessageLookupByLibrary.simpleMessage("本週熱門"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage("預載頁數"),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "再按一次返回以退出",
    ),
    "read": MessageLookupByLibrary.simpleMessage("閱讀"),
    "read_model": MessageLookupByLibrary.simpleMessage("閱讀模式"),
    "recent": MessageLookupByLibrary.simpleMessage("最近"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("最近搜尋"),
    "register": MessageLookupByLibrary.simpleMessage("註冊"),
    "replace_original": MessageLookupByLibrary.simpleMessage("取代原文"),
    "reset_to_default": MessageLookupByLibrary.simpleMessage("重設為預設"),
    "resume": MessageLookupByLibrary.simpleMessage("繼續"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("從右到左"),
    "search": MessageLookupByLibrary.simpleMessage("搜尋"),
    "security_challenge": MessageLookupByLibrary.simpleMessage("安全驗證"),
    "session_expired": MessageLookupByLibrary.simpleMessage("工作階段已過期，請重新登入"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "share": MessageLookupByLibrary.simpleMessage("分享"),
    "show_less": MessageLookupByLibrary.simpleMessage("顯示較少"),
    "show_more": MessageLookupByLibrary.simpleMessage("顯示更多"),
    "show_tags": MessageLookupByLibrary.simpleMessage("顯示標籤"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage("在列表中顯示標籤，需要下載標籤資料"),
    "single_line": MessageLookupByLibrary.simpleMessage("單行"),
    "sort_by": MessageLookupByLibrary.simpleMessage("排序方式"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage("日期（最新）"),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage("日期（最舊）"),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("標題（A–Z）"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("標題（Z–A）"),
    "system": MessageLookupByLibrary.simpleMessage("跟隨系統"),
    "tag": MessageLookupByLibrary.simpleMessage("標籤"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage("項目上的標籤排版"),
    "tag_translation": MessageLookupByLibrary.simpleMessage("標籤翻譯"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "翻譯資料更新失敗",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage("翻譯資料已更新"),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "正在下載翻譯資料⋯",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("作者"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("分類"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("角色"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("社團"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("語言"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("原作"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("標籤"),
    "tags_data": MessageLookupByLibrary.simpleMessage("標籤資料"),
    "theme": MessageLookupByLibrary.simpleMessage("主題"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("主題模式"),
    "thumbs": MessageLookupByLibrary.simpleMessage("縮圖"),
    "today": MessageLookupByLibrary.simpleMessage("今天"),
    "translated": MessageLookupByLibrary.simpleMessage("已翻譯"),
    "translating": MessageLookupByLibrary.simpleMessage("翻譯中⋯"),
    "translation_api_key": MessageLookupByLibrary.simpleMessage("API 金鑰"),
    "translation_api_url": MessageLookupByLibrary.simpleMessage("API 網址"),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "翻譯快取已清除",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage("翻譯顯示方式"),
    "translation_failed": MessageLookupByLibrary.simpleMessage("翻譯失敗"),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "未設定時使用內建翻譯服務或免費 Google 翻譯",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("模型"),
    "translation_provider": MessageLookupByLibrary.simpleMessage("翻譯提供者"),
    "translation_service_config": MessageLookupByLibrary.simpleMessage("翻譯服務"),
    "translation_settings": MessageLookupByLibrary.simpleMessage("翻譯"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage("使用圖庫色調"),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "根據封面顏色為圖庫頁面上色",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage(
      "使用 Google 翻譯",
    ),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "跳過 LLM，直接使用免費的 Google 翻譯",
    ),
    "username": MessageLookupByLibrary.simpleMessage("使用者名稱"),
    "version": MessageLookupByLibrary.simpleMessage("版本"),
    "vertical": MessageLookupByLibrary.simpleMessage("直式"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage("音量鍵翻頁"),
    "waterfall": MessageLookupByLibrary.simpleMessage("瀑布流"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage("瀑布流（緊湊）"),
    "webtoon": MessageLookupByLibrary.simpleMessage("條漫"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "WebView 請求權限",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("換行"),
    "yesterday": MessageLookupByLibrary.simpleMessage("昨天"),
  };
}

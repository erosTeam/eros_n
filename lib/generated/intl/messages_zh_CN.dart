// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
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
  String get localeName => 'zh_CN';

  static String m0(date) => "添加于 ${date}";

  static String m1(total, galleries, pages) =>
      "当前并发请求数为 ${total}（${galleries} × ${pages}），极易触发 CDN 临时封禁，导致批量下载失败或缩略图无法加载。强烈建议降低并发。";

  static String m2(total, galleries, pages) =>
      "当前并发请求数为 ${total}（${galleries} × ${pages}），可能在批量下载时触发 CDN 限流。若遇到下载失败，请适当降低并发数量。";

  static String m3(downloaded, total) => "${downloaded} / ${total} 页";

  static String m4(count) => "共 ${count} 页";

  static String m5(error) => "收藏操作失败：${error}";

  static String m6(version) => "需要下载翻译数据,当前版本: ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("关于"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("高级"),
    "all": MessageLookupByLibrary.simpleMessage("全部"),
    "always": MessageLookupByLibrary.simpleMessage("始终"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("外观"),
    "author": MessageLookupByLibrary.simpleMessage("作者"),
    "auto": MessageLookupByLibrary.simpleMessage("自动"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage("自动阅读间隔"),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("计算中..."),
    "cancel": MessageLookupByLibrary.simpleMessage("取消"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("汉语"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("清理缓存"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "确定要清理所有缓存吗？（网络响应、图片缓存）",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("清除历史"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage("确定要清除所有历史记录吗?"),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "确定要清除全部搜索历史吗?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage("剪贴板链接检测"),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "评论内容需要超过10个字符",
    ),
    "comments": MessageLookupByLibrary.simpleMessage("评论"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage("并发下载"),
    "cover_blur": MessageLookupByLibrary.simpleMessage("封面模糊"),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("垂直(连续)"),
    "current_path": MessageLookupByLibrary.simpleMessage("当前路径"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage("自定义布局宽度"),
    "dark": MessageLookupByLibrary.simpleMessage("深色"),
    "delete": MessageLookupByLibrary.simpleMessage("删除"),
    "display": MessageLookupByLibrary.simpleMessage("显示"),
    "download": MessageLookupByLibrary.simpleMessage("下载"),
    "download_completed": MessageLookupByLibrary.simpleMessage("已完成"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "将删除任务记录及所有已下载文件，确认继续？",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "删除下载",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage("下载失败"),
    "download_management": MessageLookupByLibrary.simpleMessage("下载管理"),
    "download_path": MessageLookupByLibrary.simpleMessage("下载路径"),
    "download_paused": MessageLookupByLibrary.simpleMessage("已暂停"),
    "download_pending": MessageLookupByLibrary.simpleMessage("等待中"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage("重新下载"),
    "download_settings": MessageLookupByLibrary.simpleMessage("下载设置"),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("正在下载"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("动态颜色"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage("根据壁纸自动调整主题颜色"),
    "english": MessageLookupByLibrary.simpleMessage("英语"),
    "favorite_added": MessageLookupByLibrary.simpleMessage("已添加到收藏"),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage("已取消收藏"),
    "favorites": MessageLookupByLibrary.simpleMessage("收藏"),
    "full_screen": MessageLookupByLibrary.simpleMessage("全屏"),
    "gallery": MessageLookupByLibrary.simpleMessage("画廊"),
    "general": MessageLookupByLibrary.simpleMessage("通用"),
    "grid": MessageLookupByLibrary.simpleMessage("网格"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "滚动时隐藏底部导航栏",
    ),
    "history": MessageLookupByLibrary.simpleMessage("历史"),
    "home": MessageLookupByLibrary.simpleMessage("主页"),
    "japanese": MessageLookupByLibrary.simpleMessage("日语"),
    "language": MessageLookupByLibrary.simpleMessage("语言"),
    "language_name": MessageLookupByLibrary.simpleMessage("简体中文"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("从左到右"),
    "license": MessageLookupByLibrary.simpleMessage("许可证"),
    "light": MessageLookupByLibrary.simpleMessage("浅色"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("液态玻璃"),
    "list": MessageLookupByLibrary.simpleMessage("列表"),
    "list_model": MessageLookupByLibrary.simpleMessage("列表模式"),
    "list_style": MessageLookupByLibrary.simpleMessage("列表样式"),
    "login": MessageLookupByLibrary.simpleMessage("登录"),
    "login_by_web": MessageLookupByLibrary.simpleMessage("通过网页登陆"),
    "login_invalid": MessageLookupByLibrary.simpleMessage("无效登录信息"),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage("登录需要验证码"),
    "logout": MessageLookupByLibrary.simpleMessage("登出"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "同时下载的画廊数量",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage("每画廊同时下载的页数"),
    "more": MessageLookupByLibrary.simpleMessage("更多"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("更多相似"),
    "never": MessageLookupByLibrary.simpleMessage("从不"),
    "newest": MessageLookupByLibrary.simpleMessage("最新"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("暂无下载"),
    "no_result": MessageLookupByLibrary.simpleMessage("无搜索结果"),
    "none": MessageLookupByLibrary.simpleMessage("无"),
    "ok": MessageLookupByLibrary.simpleMessage("确定"),
    "open_supported_links": MessageLookupByLibrary.simpleMessage("打开支持的链接"),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "从 Android 12 开始, 应用只有在获得许可的情况下，才能作为网络链接的处理应用。否则会使用默认浏览器处理。您可以在此手动许可",
    ),
    "password": MessageLookupByLibrary.simpleMessage("密码"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage("也可以在页面上双指缩放调整"),
    "please_login_first": MessageLookupByLibrary.simpleMessage("请先登录"),
    "please_login_web": MessageLookupByLibrary.simpleMessage("请通过网页登录"),
    "popular": MessageLookupByLibrary.simpleMessage("热门"),
    "popular_all": MessageLookupByLibrary.simpleMessage("所有热门"),
    "popular_month": MessageLookupByLibrary.simpleMessage("本月热门"),
    "popular_today": MessageLookupByLibrary.simpleMessage("本日热门"),
    "popular_week": MessageLookupByLibrary.simpleMessage("本周热门"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage("预载页数"),
    "read": MessageLookupByLibrary.simpleMessage("阅读"),
    "read_model": MessageLookupByLibrary.simpleMessage("阅读模式"),
    "recent": MessageLookupByLibrary.simpleMessage("最新发布"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("最近搜索"),
    "register": MessageLookupByLibrary.simpleMessage("注册"),
    "reset_to_default": MessageLookupByLibrary.simpleMessage("重置为默认"),
    "resume": MessageLookupByLibrary.simpleMessage("继续"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("从右到左"),
    "search": MessageLookupByLibrary.simpleMessage("搜索"),
    "settings": MessageLookupByLibrary.simpleMessage("设置"),
    "share": MessageLookupByLibrary.simpleMessage("分享"),
    "show_less": MessageLookupByLibrary.simpleMessage("显示更少内容"),
    "show_more": MessageLookupByLibrary.simpleMessage("显示更多内容"),
    "show_tags": MessageLookupByLibrary.simpleMessage("显示标签"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "在列表中显示标签, 需要下载额外标签数据",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("单行"),
    "sort_by": MessageLookupByLibrary.simpleMessage("排序"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage("添加时间（最新）"),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage("添加时间（最早）"),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("标题（A–Z）"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("标题（Z–A）"),
    "system": MessageLookupByLibrary.simpleMessage("系统"),
    "tag": MessageLookupByLibrary.simpleMessage("标签"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage("列表项标签布局"),
    "tag_translation": MessageLookupByLibrary.simpleMessage("标签翻译"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "翻译数据更新失败",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage("翻译数据更新成功"),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "正在下载翻译数据...",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("作者"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("类别"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("角色"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("团队"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("语言"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("原作"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("标签"),
    "tags_data": MessageLookupByLibrary.simpleMessage("标签数据"),
    "theme": MessageLookupByLibrary.simpleMessage("主题"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("主题模式"),
    "thumbs": MessageLookupByLibrary.simpleMessage("缩略图"),
    "today": MessageLookupByLibrary.simpleMessage("今天"),
    "translated": MessageLookupByLibrary.simpleMessage("翻译"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage("使用画廊色调"),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "根据封面的颜色给画廊页面着色",
    ),
    "username": MessageLookupByLibrary.simpleMessage("用户名"),
    "version": MessageLookupByLibrary.simpleMessage("版本"),
    "vertical": MessageLookupByLibrary.simpleMessage("垂直"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage("音量键翻页"),
    "waterfall": MessageLookupByLibrary.simpleMessage("瀑布流"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage("瀑布流 (紧凑)"),
    "webtoon": MessageLookupByLibrary.simpleMessage("条漫"),
    "wrap": MessageLookupByLibrary.simpleMessage("换行"),
    "yesterday": MessageLookupByLibrary.simpleMessage("昨天"),
  };
}

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ja locale. All the
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
  String get localeName => 'ja';

  static String m0(date) => "${date}に追加";

  static String m1(total, galleries, pages) =>
      "同時リクエスト数: ${total}（${galleries} × ${pages}）。CDNの一時的なアクセス禁止が発生する可能性が非常に高く、ダウンロードの失敗やサムネイルの表示不具合につながります。同時接続数を減らしてください。";

  static String m2(total, galleries, pages) =>
      "同時リクエスト数: ${total}（${galleries} × ${pages}）。一括ダウンロード時にCDNのレート制限が発生する可能性があります。ダウンロードに失敗する場合は同時接続数を減らしてください。";

  static String m3(downloaded, total) => "${downloaded} / ${total}ページ";

  static String m4(count) => "${count}ページ";

  static String m5(error) => "お気に入りの更新に失敗しました: ${error}";

  static String m6(version) => "タグ翻訳データのダウンロードが必要です。バージョン: ${version}";

  static String m7(count) => "${count}件の翻訳がキャッシュされています";

  static String m8(kind) => "WebViewが権限 \'\'${kind}\'\' をリクエストしました";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("アプリについて"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("詳細設定"),
    "all": MessageLookupByLibrary.simpleMessage("すべて"),
    "allow": MessageLookupByLibrary.simpleMessage("許可"),
    "always": MessageLookupByLibrary.simpleMessage("常に"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("外観"),
    "author": MessageLookupByLibrary.simpleMessage("作者"),
    "auto": MessageLookupByLibrary.simpleMessage("自動"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage("自動閲覧の間隔"),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage(
      "コメントを自動翻訳",
    ),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("二言語表示"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "これは翻訳されたコメントテキストです。",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage("二言語スタイル"),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage("コンパクト"),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage("区切り線"),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage("控えめイタリック"),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("計算中…"),
    "cancel": MessageLookupByLibrary.simpleMessage("キャンセル"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("中国語"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("キャッシュを削除"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "すべてのキャッシュデータを削除しますか？（HTTPレスポンス、画像）",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("履歴を削除"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "すべての履歴を削除してもよろしいですか？",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "すべての検索履歴を削除しますか？",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage(
      "翻訳キャッシュを削除",
    ),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "すべての翻訳キャッシュを削除しますか？",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage(
      "クリップボードのリンク検出",
    ),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "コメントは10文字以上でなければなりません",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage("コメント翻訳"),
    "comments": MessageLookupByLibrary.simpleMessage("コメント"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage("同時ダウンロード数"),
    "cover_blur": MessageLookupByLibrary.simpleMessage("カバーぼかし"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage("リストのカバー画像をぼかす"),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("めくり（縦）"),
    "current_path": MessageLookupByLibrary.simpleMessage("現在のパス"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage("カスタムレイアウト幅"),
    "custom_provider": MessageLookupByLibrary.simpleMessage("カスタム"),
    "dark": MessageLookupByLibrary.simpleMessage("ダーク"),
    "delete": MessageLookupByLibrary.simpleMessage("削除"),
    "deny": MessageLookupByLibrary.simpleMessage("拒否"),
    "display": MessageLookupByLibrary.simpleMessage("表示"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage("もう一度戻るで終了"),
    "download": MessageLookupByLibrary.simpleMessage("ダウンロード"),
    "download_completed": MessageLookupByLibrary.simpleMessage("完了"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "タスク記録とダウンロード済みファイルがすべて削除されます。続行しますか？",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "ダウンロードを削除",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage("ダウンロード失敗"),
    "download_management": MessageLookupByLibrary.simpleMessage("ダウンロード管理"),
    "download_path": MessageLookupByLibrary.simpleMessage("ダウンロード先"),
    "download_paused": MessageLookupByLibrary.simpleMessage("一時停止"),
    "download_pending": MessageLookupByLibrary.simpleMessage("待機中"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage("再ダウンロード"),
    "download_settings": MessageLookupByLibrary.simpleMessage("ダウンロード設定"),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("ダウンロード中"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("ダイナミックカラー"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage("壁紙に応じて色が変わります"),
    "english": MessageLookupByLibrary.simpleMessage("英語"),
    "favorite_added": MessageLookupByLibrary.simpleMessage("お気に入りに追加しました"),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage("お気に入りから削除しました"),
    "favorites": MessageLookupByLibrary.simpleMessage("お気に入り"),
    "fetch_models": MessageLookupByLibrary.simpleMessage("モデルを取得"),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage(
      "モデルの取得に失敗しました",
    ),
    "full_screen": MessageLookupByLibrary.simpleMessage("フルスクリーン"),
    "gallery": MessageLookupByLibrary.simpleMessage("ギャラリー"),
    "general": MessageLookupByLibrary.simpleMessage("一般"),
    "grid": MessageLookupByLibrary.simpleMessage("グリッド"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "スクロール時にナビゲーションバーを隠す",
    ),
    "history": MessageLookupByLibrary.simpleMessage("履歴"),
    "home": MessageLookupByLibrary.simpleMessage("ホーム"),
    "japanese": MessageLookupByLibrary.simpleMessage("日本語"),
    "language": MessageLookupByLibrary.simpleMessage("言語"),
    "language_name": MessageLookupByLibrary.simpleMessage("日本語"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("左から右"),
    "license": MessageLookupByLibrary.simpleMessage("ライセンス"),
    "light": MessageLookupByLibrary.simpleMessage("ライト"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("リキッドグラス"),
    "list": MessageLookupByLibrary.simpleMessage("リスト"),
    "list_model": MessageLookupByLibrary.simpleMessage("リストモード"),
    "list_style": MessageLookupByLibrary.simpleMessage("リストスタイル"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage("読み込みに失敗しました"),
    "login": MessageLookupByLibrary.simpleMessage("ログイン"),
    "login_by_web": MessageLookupByLibrary.simpleMessage("Webでログイン"),
    "login_invalid": MessageLookupByLibrary.simpleMessage("ログイン情報が無効です"),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "ログインにはCAPTCHAが必要です",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("ログアウト"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage("ログアウトしてもよろしいですか？"),
    "manual_input": MessageLookupByLibrary.simpleMessage("手動入力"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "同時ギャラリー数",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage(
      "ギャラリーあたりのページ数",
    ),
    "more": MessageLookupByLibrary.simpleMessage("その他"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("類似作品"),
    "never": MessageLookupByLibrary.simpleMessage("しない"),
    "newest": MessageLookupByLibrary.simpleMessage("新着"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("ダウンロードなし"),
    "no_result": MessageLookupByLibrary.simpleMessage("結果なし"),
    "none": MessageLookupByLibrary.simpleMessage("なし"),
    "not_initialized": MessageLookupByLibrary.simpleMessage("未初期化"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("ブラウザで開く"),
    "open_supported_links": MessageLookupByLibrary.simpleMessage("対応リンクを開く"),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "Android 12以降、アプリが承認されていない場合、ウェブリンクはデフォルトのブラウザで処理されます。ここで手動で承認できます",
    ),
    "password": MessageLookupByLibrary.simpleMessage("パスワード"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "ページ上でピンチ操作でも調整できます",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage("先にログインしてください"),
    "please_login_web": MessageLookupByLibrary.simpleMessage("Webからログインしてください"),
    "popular": MessageLookupByLibrary.simpleMessage("人気"),
    "popular_all": MessageLookupByLibrary.simpleMessage("全期間の人気"),
    "popular_month": MessageLookupByLibrary.simpleMessage("今月の人気"),
    "popular_today": MessageLookupByLibrary.simpleMessage("今日の人気"),
    "popular_week": MessageLookupByLibrary.simpleMessage("今週の人気"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage("先読みページ数"),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "もう一度戻るボタンを押して終了",
    ),
    "read": MessageLookupByLibrary.simpleMessage("読む"),
    "read_model": MessageLookupByLibrary.simpleMessage("閲覧モード"),
    "recent": MessageLookupByLibrary.simpleMessage("最近"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("最近の検索"),
    "register": MessageLookupByLibrary.simpleMessage("登録"),
    "replace_original": MessageLookupByLibrary.simpleMessage("原文を置換"),
    "reset_to_default": MessageLookupByLibrary.simpleMessage("デフォルトに戻す"),
    "resume": MessageLookupByLibrary.simpleMessage("続きから"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("右から左"),
    "search": MessageLookupByLibrary.simpleMessage("検索"),
    "security_challenge": MessageLookupByLibrary.simpleMessage("セキュリティチャレンジ"),
    "settings": MessageLookupByLibrary.simpleMessage("設定"),
    "share": MessageLookupByLibrary.simpleMessage("共有"),
    "show_less": MessageLookupByLibrary.simpleMessage("少なく表示"),
    "show_more": MessageLookupByLibrary.simpleMessage("もっと表示"),
    "show_tags": MessageLookupByLibrary.simpleMessage("タグを表示"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "リストにタグを表示します（タグデータのダウンロードが必要）",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("一行表示"),
    "sort_by": MessageLookupByLibrary.simpleMessage("並び替え"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage("日付（新しい順）"),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage("日付（古い順）"),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("タイトル（A–Z）"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("タイトル（Z–A）"),
    "system": MessageLookupByLibrary.simpleMessage("システム"),
    "tag": MessageLookupByLibrary.simpleMessage("タグ"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage("アイテム上のタグレイアウト"),
    "tag_translation": MessageLookupByLibrary.simpleMessage("タグ翻訳"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "翻訳データの更新に失敗しました",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "翻訳データが更新されました",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "翻訳データをダウンロード中…",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("作者"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("カテゴリ"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("キャラクター"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("グループ"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("言語"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("パロディ"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("タグ"),
    "tags_data": MessageLookupByLibrary.simpleMessage("タグデータ"),
    "theme": MessageLookupByLibrary.simpleMessage("テーマ"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("テーマモード"),
    "thumbs": MessageLookupByLibrary.simpleMessage("サムネイル"),
    "today": MessageLookupByLibrary.simpleMessage("今日"),
    "translated": MessageLookupByLibrary.simpleMessage("翻訳済み"),
    "translating": MessageLookupByLibrary.simpleMessage("翻訳中…"),
    "translation_api_key": MessageLookupByLibrary.simpleMessage("APIキー"),
    "translation_api_url": MessageLookupByLibrary.simpleMessage("API URL"),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "翻訳キャッシュを削除しました",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage("翻訳の表示方法"),
    "translation_failed": MessageLookupByLibrary.simpleMessage("翻訳に失敗しました"),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "未設定の場合は内蔵の翻訳サービスまたは無料のGoogle翻訳を使用します",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("モデル"),
    "translation_provider": MessageLookupByLibrary.simpleMessage("翻訳プロバイダー"),
    "translation_service_config": MessageLookupByLibrary.simpleMessage(
      "翻訳サービス",
    ),
    "translation_settings": MessageLookupByLibrary.simpleMessage("翻訳"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage("ギャラリーの色合いを使用"),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "カバー画像の色に基づいてギャラリーページを着色します",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage("Google翻訳を使用"),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "LLMをスキップして無料のGoogle翻訳を直接使用します",
    ),
    "username": MessageLookupByLibrary.simpleMessage("ユーザー名"),
    "version": MessageLookupByLibrary.simpleMessage("バージョン"),
    "vertical": MessageLookupByLibrary.simpleMessage("縦スクロール"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage("音量キーでページめくり"),
    "waterfall": MessageLookupByLibrary.simpleMessage("ウォーターフォール"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage(
      "ウォーターフォール（コンパクト）",
    ),
    "webtoon": MessageLookupByLibrary.simpleMessage("ウェブトゥーン"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "WebViewの権限リクエスト",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("折り返し"),
    "yesterday": MessageLookupByLibrary.simpleMessage("昨日"),
  };
}

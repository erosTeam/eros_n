// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  static String m0(date) => "${date}에 추가됨";

  static String m1(total, galleries, pages) =>
      "총 동시 요청 수: ${total} (${galleries} × ${pages}). CDN 임시 차단이 발생할 가능성이 매우 높아 다운로드 실패 및 썸네일 깨짐이 발생할 수 있습니다. 동시 요청 수를 줄여 주세요.";

  static String m2(total, galleries, pages) =>
      "총 동시 요청 수: ${total} (${galleries} × ${pages}). 대량 다운로드 시 CDN 속도 제한이 발생할 수 있습니다. 다운로드에 실패하면 동시 요청 수를 줄여 주세요.";

  static String m3(downloaded, total) => "${downloaded} / ${total}페이지";

  static String m4(count) => "${count}페이지";

  static String m5(error) => "즐겨찾기 업데이트 실패: ${error}";

  static String m6(version) => "태그 번역 데이터를 다운로드해야 합니다. 버전: ${version}";

  static String m7(count) => "번역 ${count}개 캐시됨";

  static String m8(kind) => "WebView에서 \'\'${kind}\'\' 권한을 요청했습니다";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("정보"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("고급"),
    "all": MessageLookupByLibrary.simpleMessage("전체"),
    "allow": MessageLookupByLibrary.simpleMessage("허용"),
    "always": MessageLookupByLibrary.simpleMessage("항상"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("외관"),
    "author": MessageLookupByLibrary.simpleMessage("작성자"),
    "auto": MessageLookupByLibrary.simpleMessage("자동"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage("자동 읽기 간격"),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage("댓글 자동 번역"),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("이중 언어"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "이것은 번역된 댓글 텍스트입니다.",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage("이중 언어 스타일"),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage("컴팩트"),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage("구분선"),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage("은은한 이탤릭"),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("계산 중..."),
    "cancel": MessageLookupByLibrary.simpleMessage("취소"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("중국어"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("캐시 삭제"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "모든 캐시 데이터를 삭제하시겠습니까? (HTTP 응답, 이미지)",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("기록 삭제"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "모든 기록을 삭제하시겠습니까?",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "모든 검색 기록을 삭제하시겠습니까?",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage("번역 캐시 삭제"),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "모든 번역 캐시를 삭제하시겠습니까?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage("클립보드 링크 감지"),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "댓글은 10자 이상이어야 합니다",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage("댓글 번역"),
    "comments": MessageLookupByLibrary.simpleMessage("댓글"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage("동시 다운로드"),
    "cover_blur": MessageLookupByLibrary.simpleMessage("표지 블러"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage(
      "목록에서 표지 이미지를 블러 처리합니다",
    ),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("세로 넘기기"),
    "current_path": MessageLookupByLibrary.simpleMessage("현재 경로"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage(
      "사용자 지정 레이아웃 너비",
    ),
    "custom_provider": MessageLookupByLibrary.simpleMessage("사용자 지정"),
    "dark": MessageLookupByLibrary.simpleMessage("다크"),
    "delete": MessageLookupByLibrary.simpleMessage("삭제"),
    "deny": MessageLookupByLibrary.simpleMessage("거부"),
    "display": MessageLookupByLibrary.simpleMessage("표시"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage(
      "한 번 더 누르면 종료됩니다",
    ),
    "download": MessageLookupByLibrary.simpleMessage("다운로드"),
    "download_completed": MessageLookupByLibrary.simpleMessage("완료됨"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "작업 기록과 다운로드된 모든 파일이 삭제됩니다. 계속하시겠습니까?",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "다운로드 삭제",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage("다운로드 실패"),
    "download_management": MessageLookupByLibrary.simpleMessage("다운로드 관리"),
    "download_path": MessageLookupByLibrary.simpleMessage("다운로드 경로"),
    "download_paused": MessageLookupByLibrary.simpleMessage("일시정지"),
    "download_pending": MessageLookupByLibrary.simpleMessage("대기 중"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage("다시 다운로드"),
    "download_settings": MessageLookupByLibrary.simpleMessage("다운로드 설정"),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("다운로드 중"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("동적 색상"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage(
      "배경 화면에 따라 색상이 변경됩니다",
    ),
    "english": MessageLookupByLibrary.simpleMessage("영어"),
    "favorite_added": MessageLookupByLibrary.simpleMessage("즐겨찾기에 추가됨"),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage("즐겨찾기에서 삭제됨"),
    "favorites": MessageLookupByLibrary.simpleMessage("즐겨찾기"),
    "fetch_models": MessageLookupByLibrary.simpleMessage("모델 가져오기"),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage("모델 가져오기 실패"),
    "full_screen": MessageLookupByLibrary.simpleMessage("전체 화면"),
    "gallery": MessageLookupByLibrary.simpleMessage("갤러리"),
    "general": MessageLookupByLibrary.simpleMessage("일반"),
    "grid": MessageLookupByLibrary.simpleMessage("그리드"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "스크롤 시 하단 내비게이션 숨기기",
    ),
    "history": MessageLookupByLibrary.simpleMessage("기록"),
    "home": MessageLookupByLibrary.simpleMessage("홈"),
    "japanese": MessageLookupByLibrary.simpleMessage("일본어"),
    "language": MessageLookupByLibrary.simpleMessage("언어"),
    "language_name": MessageLookupByLibrary.simpleMessage("한국어"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("왼쪽에서 오른쪽"),
    "license": MessageLookupByLibrary.simpleMessage("라이선스"),
    "light": MessageLookupByLibrary.simpleMessage("라이트"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("리퀴드 글래스"),
    "list": MessageLookupByLibrary.simpleMessage("목록"),
    "list_model": MessageLookupByLibrary.simpleMessage("목록 모드"),
    "list_style": MessageLookupByLibrary.simpleMessage("목록 스타일"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage("더 불러오기 실패"),
    "login": MessageLookupByLibrary.simpleMessage("로그인"),
    "login_by_web": MessageLookupByLibrary.simpleMessage("웹으로 로그인"),
    "login_invalid": MessageLookupByLibrary.simpleMessage("로그인 정보가 올바르지 않습니다"),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "로그인에 캡차가 필요합니다",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("로그아웃"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage("로그아웃하시겠습니까?"),
    "manual_input": MessageLookupByLibrary.simpleMessage("직접 입력"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "동시 갤러리 수",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage("갤러리당 페이지 수"),
    "more": MessageLookupByLibrary.simpleMessage("더 보기"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("비슷한 작품"),
    "never": MessageLookupByLibrary.simpleMessage("사용 안 함"),
    "newest": MessageLookupByLibrary.simpleMessage("최신"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("다운로드 없음"),
    "no_result": MessageLookupByLibrary.simpleMessage("결과 없음"),
    "none": MessageLookupByLibrary.simpleMessage("없음"),
    "not_initialized": MessageLookupByLibrary.simpleMessage("초기화되지 않음"),
    "ok": MessageLookupByLibrary.simpleMessage("확인"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage("브라우저에서 열기"),
    "open_supported_links": MessageLookupByLibrary.simpleMessage("지원되는 링크 열기"),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "Android 12부터 앱이 승인된 경우에만 웹 링크 처리 앱으로 사용할 수 있습니다. 그렇지 않으면 기본 브라우저로 처리됩니다. 여기서 수동으로 승인할 수 있습니다",
    ),
    "password": MessageLookupByLibrary.simpleMessage("비밀번호"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "페이지에서 핀치하여 조절할 수도 있습니다",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage("먼저 로그인해 주세요"),
    "please_login_web": MessageLookupByLibrary.simpleMessage("웹으로 로그인해 주세요"),
    "popular": MessageLookupByLibrary.simpleMessage("인기"),
    "popular_all": MessageLookupByLibrary.simpleMessage("전체 인기"),
    "popular_month": MessageLookupByLibrary.simpleMessage("월간 인기"),
    "popular_today": MessageLookupByLibrary.simpleMessage("오늘의 인기"),
    "popular_week": MessageLookupByLibrary.simpleMessage("주간 인기"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage("미리 로드할 페이지 수"),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "한 번 더 누르면 종료됩니다",
    ),
    "read": MessageLookupByLibrary.simpleMessage("읽기"),
    "read_model": MessageLookupByLibrary.simpleMessage("읽기 모드"),
    "recent": MessageLookupByLibrary.simpleMessage("최근"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("최근 검색어"),
    "register": MessageLookupByLibrary.simpleMessage("회원가입"),
    "replace_original": MessageLookupByLibrary.simpleMessage("원문 대체"),
    "reset_to_default": MessageLookupByLibrary.simpleMessage("기본값으로 초기화"),
    "resume": MessageLookupByLibrary.simpleMessage("이어서 읽기"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("오른쪽에서 왼쪽"),
    "search": MessageLookupByLibrary.simpleMessage("검색"),
    "security_challenge": MessageLookupByLibrary.simpleMessage("보안 인증"),
    "settings": MessageLookupByLibrary.simpleMessage("설정"),
    "share": MessageLookupByLibrary.simpleMessage("공유"),
    "show_less": MessageLookupByLibrary.simpleMessage("접기"),
    "show_more": MessageLookupByLibrary.simpleMessage("펼치기"),
    "show_tags": MessageLookupByLibrary.simpleMessage("태그 표시"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "목록에 태그를 표시하려면 태그 데이터를 다운로드해야 합니다",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("한 줄"),
    "sort_by": MessageLookupByLibrary.simpleMessage("정렬 기준"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage("날짜 (최신순)"),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage("날짜 (오래된순)"),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("제목 (A–Z)"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("제목 (Z–A)"),
    "system": MessageLookupByLibrary.simpleMessage("시스템"),
    "tag": MessageLookupByLibrary.simpleMessage("태그"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage("항목의 태그 레이아웃"),
    "tag_translation": MessageLookupByLibrary.simpleMessage("태그 번역"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "번역 데이터 업데이트 실패",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "번역 데이터가 업데이트되었습니다",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "번역 데이터 다운로드 중...",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("작가"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("카테고리"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("캐릭터"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("그룹"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("언어"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("패러디"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("태그"),
    "tags_data": MessageLookupByLibrary.simpleMessage("태그 데이터"),
    "theme": MessageLookupByLibrary.simpleMessage("테마"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("테마 모드"),
    "thumbs": MessageLookupByLibrary.simpleMessage("썸네일"),
    "today": MessageLookupByLibrary.simpleMessage("오늘"),
    "translated": MessageLookupByLibrary.simpleMessage("번역됨"),
    "translating": MessageLookupByLibrary.simpleMessage("번역 중..."),
    "translation_api_key": MessageLookupByLibrary.simpleMessage("API 키"),
    "translation_api_url": MessageLookupByLibrary.simpleMessage("API URL"),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "번역 캐시가 삭제되었습니다",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage(
      "번역 표시 방식",
    ),
    "translation_failed": MessageLookupByLibrary.simpleMessage("번역 실패"),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "설정하지 않으면 내장 번역 서비스 또는 무료 Google 번역을 사용합니다",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("모델"),
    "translation_provider": MessageLookupByLibrary.simpleMessage("번역 제공자"),
    "translation_service_config": MessageLookupByLibrary.simpleMessage(
      "번역 서비스",
    ),
    "translation_settings": MessageLookupByLibrary.simpleMessage("번역"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage("갤러리 색조 사용"),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "표지 색상을 기반으로 갤러리 페이지에 색조를 적용합니다",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage(
      "Google 번역 사용",
    ),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "LLM을 건너뛰고 무료 Google 번역을 직접 사용합니다",
    ),
    "username": MessageLookupByLibrary.simpleMessage("사용자 이름"),
    "version": MessageLookupByLibrary.simpleMessage("버전"),
    "vertical": MessageLookupByLibrary.simpleMessage("세로"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage(
      "볼륨 키로 페이지 넘기기",
    ),
    "waterfall": MessageLookupByLibrary.simpleMessage("워터폴"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage("워터폴 (컴팩트)"),
    "webtoon": MessageLookupByLibrary.simpleMessage("웹툰"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "WebView 권한 요청",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("줄바꿈"),
    "yesterday": MessageLookupByLibrary.simpleMessage("어제"),
  };
}

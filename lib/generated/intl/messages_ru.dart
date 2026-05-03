// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(date) => "Добавлено ${date}";

  static String m1(total, galleries, pages) =>
      "Всего одновременных запросов: ${total} (${galleries} × ${pages}). Очень вероятна временная блокировка CDN, что приведёт к ошибкам загрузки и сломанным миниатюрам. Уменьшите параллелизм.";

  static String m2(total, galleries, pages) =>
      "Всего одновременных запросов: ${total} (${galleries} × ${pages}). Это может вызвать ограничение CDN при массовой загрузке. Уменьшите параллелизм, если загрузки не работают.";

  static String m3(downloaded, total) => "${downloaded} / ${total} стр.";

  static String m4(count) => "${count} стр.";

  static String m5(error) => "Не удалось обновить избранное: ${error}";

  static String m6(version) =>
      "Требуется скачать данные перевода тегов, версия: ${version}";

  static String m7(count) => "${count} сохранённых переводов";

  static String m8(kind) => "WebView запросил разрешение \'\'${kind}\'\'";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("О приложении"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("Дополнительно"),
    "all": MessageLookupByLibrary.simpleMessage("Все"),
    "allow": MessageLookupByLibrary.simpleMessage("Разрешить"),
    "always": MessageLookupByLibrary.simpleMessage("Всегда"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("Внешний вид"),
    "author": MessageLookupByLibrary.simpleMessage("Автор"),
    "auto": MessageLookupByLibrary.simpleMessage("Авто"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage(
      "Интервал автопрокрутки",
    ),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage(
      "Автоперевод комментариев",
    ),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("Двуязычный"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "Это переведённый текст комментария.",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage(
      "Стиль двуязычного отображения",
    ),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage(
      "Компактный",
    ),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage(
      "Разделитель",
    ),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage(
      "Мелкий курсив",
    ),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("Подсчёт..."),
    "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("Китайский"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("Очистить кэш"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Очистить все кэшированные данные? (HTTP-ответы, изображения)",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("Очистить историю"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите очистить всю историю?",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "Очистить историю поиска?",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage(
      "Очистить кэш переводов",
    ),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Очистить все сохранённые переводы?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage(
      "Обнаружение ссылок в буфере обмена",
    ),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "Комментарий должен быть длиннее 10 символов",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage(
      "Перевод комментариев",
    ),
    "comments": MessageLookupByLibrary.simpleMessage("Комментарии"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage(
      "Параллельные загрузки",
    ),
    "cover_blur": MessageLookupByLibrary.simpleMessage("Размытие обложки"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage(
      "Размывать обложку в списке",
    ),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("Перелистывание"),
    "current_path": MessageLookupByLibrary.simpleMessage("Текущий путь"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage(
      "Пользовательская ширина макета",
    ),
    "custom_provider": MessageLookupByLibrary.simpleMessage("Другой"),
    "dark": MessageLookupByLibrary.simpleMessage("Тёмная"),
    "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
    "deny": MessageLookupByLibrary.simpleMessage("Отклонить"),
    "display": MessageLookupByLibrary.simpleMessage("Отображение"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage(
      "Нажмите дважды для выхода",
    ),
    "download": MessageLookupByLibrary.simpleMessage("Скачать"),
    "download_completed": MessageLookupByLibrary.simpleMessage("Завершено"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Запись о загрузке и все скачанные файлы будут удалены. Продолжить?",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "Удалить загрузку",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage("Ошибка загрузки"),
    "download_management": MessageLookupByLibrary.simpleMessage("Загрузки"),
    "download_path": MessageLookupByLibrary.simpleMessage("Путь загрузки"),
    "download_paused": MessageLookupByLibrary.simpleMessage("Приостановлено"),
    "download_pending": MessageLookupByLibrary.simpleMessage("В очереди"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage(
      "Скачать заново",
    ),
    "download_settings": MessageLookupByLibrary.simpleMessage(
      "Настройки загрузки",
    ),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("Загрузка"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("Динамический цвет"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage(
      "Цвет будет меняться в зависимости от обоев",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Английский"),
    "favorite_added": MessageLookupByLibrary.simpleMessage(
      "Добавлено в избранное",
    ),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage(
      "Удалено из избранного",
    ),
    "favorites": MessageLookupByLibrary.simpleMessage("Избранное"),
    "fetch_models": MessageLookupByLibrary.simpleMessage("Получить модели"),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage(
      "Не удалось получить модели",
    ),
    "full_screen": MessageLookupByLibrary.simpleMessage("Полный экран"),
    "gallery": MessageLookupByLibrary.simpleMessage("Галерея"),
    "general": MessageLookupByLibrary.simpleMessage("Общие"),
    "grid": MessageLookupByLibrary.simpleMessage("Сетка"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "Скрывать навигацию при прокрутке",
    ),
    "history": MessageLookupByLibrary.simpleMessage("История"),
    "home": MessageLookupByLibrary.simpleMessage("Главная"),
    "japanese": MessageLookupByLibrary.simpleMessage("Японский"),
    "language": MessageLookupByLibrary.simpleMessage("Язык"),
    "language_name": MessageLookupByLibrary.simpleMessage("Русский"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("Слева направо"),
    "license": MessageLookupByLibrary.simpleMessage("Лицензия"),
    "light": MessageLookupByLibrary.simpleMessage("Светлая"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("Жидкое стекло"),
    "list": MessageLookupByLibrary.simpleMessage("Список"),
    "list_model": MessageLookupByLibrary.simpleMessage("Вид списка"),
    "list_style": MessageLookupByLibrary.simpleMessage("Стиль списка"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage(
      "Не удалось загрузить ещё",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Вход"),
    "login_by_web": MessageLookupByLibrary.simpleMessage("Войти через браузер"),
    "login_invalid": MessageLookupByLibrary.simpleMessage(
      "Неверные данные для входа",
    ),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "Требуется капча",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Выход"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage(
      "Вы уверены, что хотите выйти?",
    ),
    "manual_input": MessageLookupByLibrary.simpleMessage("Ввести вручную"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "Одновременных галерей",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage(
      "Страниц на галерею",
    ),
    "more": MessageLookupByLibrary.simpleMessage("Ещё"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("Похожее"),
    "never": MessageLookupByLibrary.simpleMessage("Никогда"),
    "newest": MessageLookupByLibrary.simpleMessage("Новинки"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("Нет загрузок"),
    "no_result": MessageLookupByLibrary.simpleMessage("Нет результатов"),
    "none": MessageLookupByLibrary.simpleMessage("Нет"),
    "not_initialized": MessageLookupByLibrary.simpleMessage(
      "Не инициализировано",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("ОК"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Открыть в браузере",
    ),
    "open_supported_links": MessageLookupByLibrary.simpleMessage(
      "Открывать поддерживаемые ссылки",
    ),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "Начиная с Android 12, приложения могут обрабатывать веб-ссылки только с одобрения. Иначе ссылки откроются в браузере. Вы можете одобрить это вручную",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Пароль"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "Также можно увеличить щипком на странице",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage(
      "Сначала войдите в аккаунт",
    ),
    "please_login_web": MessageLookupByLibrary.simpleMessage(
      "Войдите через браузер",
    ),
    "popular": MessageLookupByLibrary.simpleMessage("Популярное"),
    "popular_all": MessageLookupByLibrary.simpleMessage(
      "Популярное за всё время",
    ),
    "popular_month": MessageLookupByLibrary.simpleMessage(
      "Популярное за месяц",
    ),
    "popular_today": MessageLookupByLibrary.simpleMessage(
      "Популярное за сегодня",
    ),
    "popular_week": MessageLookupByLibrary.simpleMessage(
      "Популярное за неделю",
    ),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage(
      "Количество предзагруженных страниц",
    ),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "Нажмите назад ещё раз для выхода",
    ),
    "read": MessageLookupByLibrary.simpleMessage("Читать"),
    "read_model": MessageLookupByLibrary.simpleMessage("Режим чтения"),
    "recent": MessageLookupByLibrary.simpleMessage("Недавние"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("Недавние запросы"),
    "register": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "replace_original": MessageLookupByLibrary.simpleMessage(
      "Заменить оригинал",
    ),
    "reset_to_default": MessageLookupByLibrary.simpleMessage(
      "Сбросить по умолчанию",
    ),
    "resume": MessageLookupByLibrary.simpleMessage("Продолжить"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("Справа налево"),
    "search": MessageLookupByLibrary.simpleMessage("Поиск"),
    "security_challenge": MessageLookupByLibrary.simpleMessage(
      "Проверка безопасности",
    ),
    "session_expired": MessageLookupByLibrary.simpleMessage(
      "Сессия истекла, пожалуйста, войдите снова",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Настройки"),
    "share": MessageLookupByLibrary.simpleMessage("Поделиться"),
    "show_less": MessageLookupByLibrary.simpleMessage("Показать меньше"),
    "show_more": MessageLookupByLibrary.simpleMessage("Показать больше"),
    "show_tags": MessageLookupByLibrary.simpleMessage("Показывать теги"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "Показывать теги в списке, требуется скачать данные тегов",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("В одну строку"),
    "sort_by": MessageLookupByLibrary.simpleMessage("Сортировка"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage("По дате (новые)"),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage(
      "По дате (старые)",
    ),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("По названию (А–Я)"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("По названию (Я–А)"),
    "system": MessageLookupByLibrary.simpleMessage("Системная"),
    "tag": MessageLookupByLibrary.simpleMessage("Тег"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage(
      "Расположение тегов на элементе",
    ),
    "tag_translation": MessageLookupByLibrary.simpleMessage("Перевод тегов"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "Не удалось обновить данные перевода",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "Данные перевода обновлены",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "Загрузка данных перевода...",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("Авторы"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("Категории"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("Персонажи"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("Группы"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("Языки"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("Пародии"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("Теги"),
    "tags_data": MessageLookupByLibrary.simpleMessage("Данные тегов"),
    "theme": MessageLookupByLibrary.simpleMessage("Тема"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Тема"),
    "thumbs": MessageLookupByLibrary.simpleMessage("Миниатюры"),
    "today": MessageLookupByLibrary.simpleMessage("Сегодня"),
    "translated": MessageLookupByLibrary.simpleMessage("Переведённые"),
    "translating": MessageLookupByLibrary.simpleMessage("Перевод..."),
    "translation_api_key": MessageLookupByLibrary.simpleMessage("Ключ API"),
    "translation_api_url": MessageLookupByLibrary.simpleMessage("URL API"),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "Кэш переводов очищен",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage(
      "Отображение перевода",
    ),
    "translation_failed": MessageLookupByLibrary.simpleMessage(
      "Ошибка перевода",
    ),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "Использует встроенный сервис перевода или бесплатный Google Translate, если не настроено",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("Модель"),
    "translation_provider": MessageLookupByLibrary.simpleMessage(
      "Провайдер перевода",
    ),
    "translation_service_config": MessageLookupByLibrary.simpleMessage(
      "Сервис перевода",
    ),
    "translation_settings": MessageLookupByLibrary.simpleMessage("Перевод"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage(
      "Цветовой оттенок галереи",
    ),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "Окрашивать страницы галереи на основе цвета обложки",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage(
      "Использовать Google Translate",
    ),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "Использовать бесплатный Google Translate напрямую, минуя LLM",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "version": MessageLookupByLibrary.simpleMessage("Версия"),
    "vertical": MessageLookupByLibrary.simpleMessage("Вертикальный"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage(
      "Перелистывание кнопками громкости",
    ),
    "waterfall": MessageLookupByLibrary.simpleMessage("Водопад"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage(
      "Водопад (компактный)",
    ),
    "webtoon": MessageLookupByLibrary.simpleMessage("Вебтун"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "Запрос разрешения WebView",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("Перенос"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Вчера"),
  };
}

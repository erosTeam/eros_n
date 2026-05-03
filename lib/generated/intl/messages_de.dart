// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(date) => "Hinzugefügt am ${date}";

  static String m1(total, galleries, pages) =>
      "Gleichzeitige Anfragen: ${total} (${galleries} × ${pages}). Sehr wahrscheinlich wird eine temporäre CDN-Sperre ausgelöst, was zu Download-Fehlern und fehlenden Vorschaubildern führt. Reduzieren Sie die Gleichzeitigkeit.";

  static String m2(total, galleries, pages) =>
      "Gleichzeitige Anfragen: ${total} (${galleries} × ${pages}). Bei Massendownloads kann dies CDN-Ratenbegrenzungen auslösen. Reduzieren Sie die Gleichzeitigkeit, wenn Downloads fehlschlagen.";

  static String m3(downloaded, total) => "${downloaded} / ${total} Seiten";

  static String m4(count) => "${count} Seiten";

  static String m5(error) =>
      "Favoritenstatus konnte nicht aktualisiert werden: ${error}";

  static String m6(version) =>
      "Erfordert den Download der Tag-Übersetzungsdaten, Version: ${version}";

  static String m7(count) => "${count} gespeicherte Übersetzungen";

  static String m8(kind) =>
      "WebView hat die Berechtigung \'\'${kind}\'\' angefordert";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Über"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("Erweitert"),
    "all": MessageLookupByLibrary.simpleMessage("Alle"),
    "allow": MessageLookupByLibrary.simpleMessage("Erlauben"),
    "always": MessageLookupByLibrary.simpleMessage("Immer"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("Darstellung"),
    "author": MessageLookupByLibrary.simpleMessage("Autor"),
    "auto": MessageLookupByLibrary.simpleMessage("Automatisch"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage(
      "Intervall für automatisches Lesen",
    ),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage(
      "Kommentare automatisch übersetzen",
    ),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("Zweisprachig"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "Dies ist der übersetzte Kommentartext.",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage(
      "Zweisprachiger Stil",
    ),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage("Kompakt"),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage(
      "Trennlinie",
    ),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage(
      "Dezent kursiv",
    ),
    "cache_calculating": MessageLookupByLibrary.simpleMessage(
      "Wird berechnet…",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("Chinesisch"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("Cache leeren"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Alle zwischengespeicherten Daten löschen? (HTTP-Antworten, Bilder)",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("Verlauf löschen"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "Möchten Sie wirklich den gesamten Verlauf löschen?",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "Gesamten Suchverlauf löschen?",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage(
      "Übersetzungscache leeren",
    ),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Alle zwischengespeicherten Übersetzungen löschen?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage(
      "Link-Erkennung in der Zwischenablage",
    ),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "Kommentar muss länger als 10 Zeichen sein",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage(
      "Kommentar-Übersetzung",
    ),
    "comments": MessageLookupByLibrary.simpleMessage("Kommentare"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage(
      "Gleichzeitige Downloads",
    ),
    "cover_blur": MessageLookupByLibrary.simpleMessage("Cover-Unschärfe"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage(
      "Coverbild in der Liste unscharf darstellen",
    ),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("Vertikal blättern"),
    "current_path": MessageLookupByLibrary.simpleMessage("Aktueller Pfad"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage(
      "Benutzerdefinierte Layoutbreite",
    ),
    "custom_provider": MessageLookupByLibrary.simpleMessage(
      "Benutzerdefiniert",
    ),
    "dark": MessageLookupByLibrary.simpleMessage("Dunkel"),
    "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
    "deny": MessageLookupByLibrary.simpleMessage("Ablehnen"),
    "display": MessageLookupByLibrary.simpleMessage("Anzeige"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage(
      "Zweimal drücken zum Beenden",
    ),
    "download": MessageLookupByLibrary.simpleMessage("Herunterladen"),
    "download_completed": MessageLookupByLibrary.simpleMessage("Abgeschlossen"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Der Auftrag und alle heruntergeladenen Dateien werden gelöscht. Fortfahren?",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "Download löschen",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage(
      "Download fehlgeschlagen",
    ),
    "download_management": MessageLookupByLibrary.simpleMessage("Downloads"),
    "download_path": MessageLookupByLibrary.simpleMessage("Downloadpfad"),
    "download_paused": MessageLookupByLibrary.simpleMessage("Pausiert"),
    "download_pending": MessageLookupByLibrary.simpleMessage("Ausstehend"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage(
      "Erneut herunterladen",
    ),
    "download_settings": MessageLookupByLibrary.simpleMessage(
      "Download-Einstellungen",
    ),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("Wird heruntergeladen"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("Dynamische Farbe"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage(
      "Farbe passt sich dem Hintergrundbild an",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Englisch"),
    "favorite_added": MessageLookupByLibrary.simpleMessage(
      "Zu Favoriten hinzugefügt",
    ),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage(
      "Aus Favoriten entfernt",
    ),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoriten"),
    "fetch_models": MessageLookupByLibrary.simpleMessage("Modelle abrufen"),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage(
      "Modelle konnten nicht abgerufen werden",
    ),
    "full_screen": MessageLookupByLibrary.simpleMessage("Vollbild"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galerie"),
    "general": MessageLookupByLibrary.simpleMessage("Allgemein"),
    "grid": MessageLookupByLibrary.simpleMessage("Raster"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "Navigationsleiste beim Scrollen ausblenden",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Verlauf"),
    "home": MessageLookupByLibrary.simpleMessage("Startseite"),
    "japanese": MessageLookupByLibrary.simpleMessage("Japanisch"),
    "language": MessageLookupByLibrary.simpleMessage("Sprache"),
    "language_name": MessageLookupByLibrary.simpleMessage("Deutsch"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("Links nach rechts"),
    "license": MessageLookupByLibrary.simpleMessage("Lizenz"),
    "light": MessageLookupByLibrary.simpleMessage("Hell"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("Liquid Glass"),
    "list": MessageLookupByLibrary.simpleMessage("Liste"),
    "list_model": MessageLookupByLibrary.simpleMessage("Listenansicht"),
    "list_style": MessageLookupByLibrary.simpleMessage("Listenstil"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage(
      "Laden fehlgeschlagen",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Anmelden"),
    "login_by_web": MessageLookupByLibrary.simpleMessage("Über Web anmelden"),
    "login_invalid": MessageLookupByLibrary.simpleMessage("Anmeldung ungültig"),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "Anmeldung erfordert Captcha",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Abmelden"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage(
      "Möchten Sie sich wirklich abmelden?",
    ),
    "manual_input": MessageLookupByLibrary.simpleMessage("Manuelle Eingabe"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "Gleichzeitige Galerien",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage(
      "Seiten pro Galerie",
    ),
    "more": MessageLookupByLibrary.simpleMessage("Mehr"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("Mehr davon"),
    "never": MessageLookupByLibrary.simpleMessage("Nie"),
    "newest": MessageLookupByLibrary.simpleMessage("Neueste"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("Keine Downloads"),
    "no_result": MessageLookupByLibrary.simpleMessage("Keine Ergebnisse"),
    "none": MessageLookupByLibrary.simpleMessage("Keine"),
    "not_initialized": MessageLookupByLibrary.simpleMessage(
      "Nicht initialisiert",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Im Browser öffnen",
    ),
    "open_supported_links": MessageLookupByLibrary.simpleMessage(
      "Unterstützte Links öffnen",
    ),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "Ab Android 12 können Apps nur dann als Weblink-Handler fungieren, wenn sie genehmigt sind. Andernfalls wird der Standardbrowser verwendet. Sie können dies hier manuell genehmigen",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Passwort"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "Sie können auch auf der Seite zum Anpassen pinchen",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage(
      "Bitte zuerst anmelden",
    ),
    "please_login_web": MessageLookupByLibrary.simpleMessage(
      "Bitte über Web anmelden",
    ),
    "popular": MessageLookupByLibrary.simpleMessage("Beliebt"),
    "popular_all": MessageLookupByLibrary.simpleMessage("Beliebt (gesamt)"),
    "popular_month": MessageLookupByLibrary.simpleMessage(
      "Beliebt diesen Monat",
    ),
    "popular_today": MessageLookupByLibrary.simpleMessage("Beliebt heute"),
    "popular_week": MessageLookupByLibrary.simpleMessage("Beliebt diese Woche"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage(
      "Anzahl vorgeladener Seiten",
    ),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "Erneut drücken zum Beenden",
    ),
    "read": MessageLookupByLibrary.simpleMessage("Lesen"),
    "read_model": MessageLookupByLibrary.simpleMessage("Lesemodus"),
    "recent": MessageLookupByLibrary.simpleMessage("Kürzlich"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("Letzte Suchen"),
    "register": MessageLookupByLibrary.simpleMessage("Registrieren"),
    "replace_original": MessageLookupByLibrary.simpleMessage(
      "Original ersetzen",
    ),
    "reset_to_default": MessageLookupByLibrary.simpleMessage(
      "Auf Standard zurücksetzen",
    ),
    "resume": MessageLookupByLibrary.simpleMessage("Fortsetzen"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("Rechts nach links"),
    "search": MessageLookupByLibrary.simpleMessage("Suchen"),
    "security_challenge": MessageLookupByLibrary.simpleMessage(
      "Sicherheitsüberprüfung",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
    "share": MessageLookupByLibrary.simpleMessage("Teilen"),
    "show_less": MessageLookupByLibrary.simpleMessage("Weniger anzeigen"),
    "show_more": MessageLookupByLibrary.simpleMessage("Mehr anzeigen"),
    "show_tags": MessageLookupByLibrary.simpleMessage("Tags anzeigen"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "Tags in der Liste anzeigen (erfordert Download der Tag-Daten)",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("Einzeilig"),
    "sort_by": MessageLookupByLibrary.simpleMessage("Sortieren nach"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage("Datum (neueste)"),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage("Datum (älteste)"),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("Titel (A–Z)"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("Titel (Z–A)"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "tag": MessageLookupByLibrary.simpleMessage("Tag"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage(
      "Tag-Anordnung auf Element",
    ),
    "tag_translation": MessageLookupByLibrary.simpleMessage("Tag-Übersetzung"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "Aktualisierung der Übersetzungsdaten fehlgeschlagen",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "Übersetzungsdaten aktualisiert",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "Übersetzungsdaten werden heruntergeladen…",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("Künstler"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("Kategorien"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("Charaktere"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("Gruppen"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("Sprachen"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("Parodien"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("Tags"),
    "tags_data": MessageLookupByLibrary.simpleMessage("Tag-Daten"),
    "theme": MessageLookupByLibrary.simpleMessage("Design"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Design-Modus"),
    "thumbs": MessageLookupByLibrary.simpleMessage("Vorschaubilder"),
    "today": MessageLookupByLibrary.simpleMessage("Heute"),
    "translated": MessageLookupByLibrary.simpleMessage("Übersetzt"),
    "translating": MessageLookupByLibrary.simpleMessage("Wird übersetzt…"),
    "translation_api_key": MessageLookupByLibrary.simpleMessage(
      "API-Schlüssel",
    ),
    "translation_api_url": MessageLookupByLibrary.simpleMessage("API-URL"),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "Übersetzungscache geleert",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage(
      "Übersetzungsanzeige",
    ),
    "translation_failed": MessageLookupByLibrary.simpleMessage(
      "Übersetzung fehlgeschlagen",
    ),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "Verwendet den integrierten Übersetzungsdienst oder kostenloses Google Translate, wenn nicht konfiguriert",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("Modell"),
    "translation_provider": MessageLookupByLibrary.simpleMessage(
      "Übersetzungsanbieter",
    ),
    "translation_service_config": MessageLookupByLibrary.simpleMessage(
      "Übersetzungsdienst",
    ),
    "translation_settings": MessageLookupByLibrary.simpleMessage("Übersetzung"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage("Galerie-Tönung"),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "Galerieseiten anhand der Coverfarbe einfärben",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage(
      "Google Translate verwenden",
    ),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "LLM überspringen und direkt kostenloses Google Translate verwenden",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Benutzername"),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "vertical": MessageLookupByLibrary.simpleMessage("Vertikal"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage(
      "Lautstärketasten zum Blättern",
    ),
    "waterfall": MessageLookupByLibrary.simpleMessage("Wasserfall"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage(
      "Wasserfall (kompakt)",
    ),
    "webtoon": MessageLookupByLibrary.simpleMessage("Webtoon"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "WebView-Berechtigung angefordert",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("Umbruch"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Gestern"),
  };
}

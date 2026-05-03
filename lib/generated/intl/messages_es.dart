// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(date) => "Añadido el ${date}";

  static String m1(total, galleries, pages) =>
      "Total de solicitudes simultáneas: ${total} (${galleries} × ${pages}). Es muy probable que se active un bloqueo temporal del CDN, causando fallos de descarga y miniaturas rotas. Reduce la concurrencia.";

  static String m2(total, galleries, pages) =>
      "Total de solicitudes simultáneas: ${total} (${galleries} × ${pages}). Esto puede activar el límite de velocidad del CDN durante descargas masivas. Reduce la concurrencia si las descargas fallan.";

  static String m3(downloaded, total) => "${downloaded} / ${total} páginas";

  static String m4(count) => "${count} páginas";

  static String m5(error) => "Error al actualizar favorito: ${error}";

  static String m6(version) =>
      "Es necesario descargar los datos de traducción de etiquetas, versión: ${version}";

  static String m7(count) => "${count} traducciones en caché";

  static String m8(kind) => "WebView ha solicitado el permiso \'\'${kind}\'\'";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Acerca de"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("Avanzado"),
    "all": MessageLookupByLibrary.simpleMessage("Todo"),
    "allow": MessageLookupByLibrary.simpleMessage("Permitir"),
    "always": MessageLookupByLibrary.simpleMessage("Siempre"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("Apariencia"),
    "author": MessageLookupByLibrary.simpleMessage("Autor"),
    "auto": MessageLookupByLibrary.simpleMessage("Automático"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage(
      "Intervalo de lectura automática",
    ),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage(
      "Traducir comentarios automáticamente",
    ),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("Bilingüe"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "Este es el texto del comentario traducido.",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage("Estilo bilingüe"),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage("Compacto"),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage("Divisor"),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage(
      "Cursiva sutil",
    ),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("Calculando…"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("Chino"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("Borrar caché"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "¿Borrar todos los datos en caché? (respuestas HTTP, imágenes)",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("Borrar historial"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "¿Seguro que quieres borrar todo el historial?",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "¿Borrar todo el historial de búsqueda?",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage(
      "Borrar caché de traducciones",
    ),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "¿Borrar todas las traducciones en caché?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage(
      "Detectar enlaces del portapapeles",
    ),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "El comentario debe tener más de 10 caracteres",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage(
      "Traducción de comentarios",
    ),
    "comments": MessageLookupByLibrary.simpleMessage("Comentarios"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage(
      "Descargas simultáneas",
    ),
    "cover_blur": MessageLookupByLibrary.simpleMessage("Difuminar portada"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage(
      "Difuminar la imagen de portada en la lista",
    ),
    "curl_vertical": MessageLookupByLibrary.simpleMessage(
      "Vertical con efecto de página",
    ),
    "current_path": MessageLookupByLibrary.simpleMessage("Ruta actual"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage(
      "Ancho de diseño personalizado",
    ),
    "custom_provider": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "dark": MessageLookupByLibrary.simpleMessage("Oscuro"),
    "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
    "deny": MessageLookupByLibrary.simpleMessage("Denegar"),
    "display": MessageLookupByLibrary.simpleMessage("Pantalla"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage(
      "Pulsa atrás dos veces para salir",
    ),
    "download": MessageLookupByLibrary.simpleMessage("Descargar"),
    "download_completed": MessageLookupByLibrary.simpleMessage("Completada"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Se eliminará el registro de la tarea y todos los archivos descargados. ¿Continuar?",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "Eliminar descarga",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage("Descarga fallida"),
    "download_management": MessageLookupByLibrary.simpleMessage("Descargas"),
    "download_path": MessageLookupByLibrary.simpleMessage("Ruta de descarga"),
    "download_paused": MessageLookupByLibrary.simpleMessage("Pausada"),
    "download_pending": MessageLookupByLibrary.simpleMessage("Pendiente"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage(
      "Volver a descargar",
    ),
    "download_settings": MessageLookupByLibrary.simpleMessage(
      "Ajustes de descarga",
    ),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("Descargando"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("Color dinámico"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage(
      "El color cambiará según el fondo de pantalla",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Inglés"),
    "favorite_added": MessageLookupByLibrary.simpleMessage(
      "Añadido a favoritos",
    ),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage(
      "Eliminado de favoritos",
    ),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
    "fetch_models": MessageLookupByLibrary.simpleMessage("Obtener modelos"),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage(
      "Error al obtener modelos",
    ),
    "full_screen": MessageLookupByLibrary.simpleMessage("Pantalla completa"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galería"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "grid": MessageLookupByLibrary.simpleMessage("Cuadrícula"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "Ocultar barra inferior al desplazar",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Historial"),
    "home": MessageLookupByLibrary.simpleMessage("Inicio"),
    "japanese": MessageLookupByLibrary.simpleMessage("Japonés"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "language_name": MessageLookupByLibrary.simpleMessage("Español"),
    "left_to_right": MessageLookupByLibrary.simpleMessage(
      "De izquierda a derecha",
    ),
    "license": MessageLookupByLibrary.simpleMessage("Licencia"),
    "light": MessageLookupByLibrary.simpleMessage("Claro"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("Liquid Glass"),
    "list": MessageLookupByLibrary.simpleMessage("Lista"),
    "list_model": MessageLookupByLibrary.simpleMessage("Modo de lista"),
    "list_style": MessageLookupByLibrary.simpleMessage("Estilo de lista"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage(
      "Error al cargar más",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Iniciar sesión"),
    "login_by_web": MessageLookupByLibrary.simpleMessage(
      "Iniciar sesión por web",
    ),
    "login_invalid": MessageLookupByLibrary.simpleMessage(
      "Inicio de sesión no válido",
    ),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "Se necesita captcha para iniciar sesión",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage(
      "¿Seguro que quieres cerrar sesión?",
    ),
    "manual_input": MessageLookupByLibrary.simpleMessage("Entrada manual"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "Galerías simultáneas",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage(
      "Páginas por galería",
    ),
    "more": MessageLookupByLibrary.simpleMessage("Más"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("Más como esto"),
    "never": MessageLookupByLibrary.simpleMessage("Nunca"),
    "newest": MessageLookupByLibrary.simpleMessage("Más reciente"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("Sin descargas"),
    "no_result": MessageLookupByLibrary.simpleMessage("Sin resultados"),
    "none": MessageLookupByLibrary.simpleMessage("Ninguno"),
    "not_initialized": MessageLookupByLibrary.simpleMessage("No inicializado"),
    "ok": MessageLookupByLibrary.simpleMessage("Aceptar"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Abrir en navegador",
    ),
    "open_supported_links": MessageLookupByLibrary.simpleMessage(
      "Abrir enlaces compatibles",
    ),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "A partir de Android 12, las apps solo pueden manejar enlaces web si están aprobadas. De lo contrario, se usará el navegador predeterminado. Puedes aprobarlo manualmente aquí",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Contraseña"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "También puedes pellizcar para ajustar en la página",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión primero",
    ),
    "please_login_web": MessageLookupByLibrary.simpleMessage(
      "Inicia sesión desde la web",
    ),
    "popular": MessageLookupByLibrary.simpleMessage("Popular"),
    "popular_all": MessageLookupByLibrary.simpleMessage("Popular (todo)"),
    "popular_month": MessageLookupByLibrary.simpleMessage("Popular este mes"),
    "popular_today": MessageLookupByLibrary.simpleMessage("Popular hoy"),
    "popular_week": MessageLookupByLibrary.simpleMessage("Popular esta semana"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage(
      "Páginas a precargar",
    ),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "Pulsa atrás otra vez para salir",
    ),
    "read": MessageLookupByLibrary.simpleMessage("Leer"),
    "read_model": MessageLookupByLibrary.simpleMessage("Modo de lectura"),
    "recent": MessageLookupByLibrary.simpleMessage("Reciente"),
    "recent_searches": MessageLookupByLibrary.simpleMessage(
      "Búsquedas recientes",
    ),
    "register": MessageLookupByLibrary.simpleMessage("Registrarse"),
    "replace_original": MessageLookupByLibrary.simpleMessage(
      "Reemplazar original",
    ),
    "reset_to_default": MessageLookupByLibrary.simpleMessage(
      "Restablecer valores predeterminados",
    ),
    "resume": MessageLookupByLibrary.simpleMessage("Continuar"),
    "right_to_left": MessageLookupByLibrary.simpleMessage(
      "De derecha a izquierda",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Buscar"),
    "security_challenge": MessageLookupByLibrary.simpleMessage(
      "Desafío de seguridad",
    ),
    "session_expired": MessageLookupByLibrary.simpleMessage(
      "Sesión expirada, inicie sesión nuevamente",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
    "share": MessageLookupByLibrary.simpleMessage("Compartir"),
    "show_less": MessageLookupByLibrary.simpleMessage("Mostrar menos"),
    "show_more": MessageLookupByLibrary.simpleMessage("Mostrar más"),
    "show_tags": MessageLookupByLibrary.simpleMessage("Mostrar etiquetas"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "Mostrar etiquetas en la lista; es necesario descargar los datos de etiquetas",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("Una línea"),
    "sort_by": MessageLookupByLibrary.simpleMessage("Ordenar por"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage(
      "Fecha (más reciente)",
    ),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage(
      "Fecha (más antigua)",
    ),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("Título (A–Z)"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("Título (Z–A)"),
    "system": MessageLookupByLibrary.simpleMessage("Sistema"),
    "tag": MessageLookupByLibrary.simpleMessage("Etiqueta"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage(
      "Disposición de etiquetas en el elemento",
    ),
    "tag_translation": MessageLookupByLibrary.simpleMessage(
      "Traducción de etiquetas",
    ),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "Error al actualizar los datos de traducción",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "Datos de traducción actualizados",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "Descargando datos de traducción…",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("Artistas"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("Categorías"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("Personajes"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("Grupos"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("Idiomas"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("Parodias"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("Etiquetas"),
    "tags_data": MessageLookupByLibrary.simpleMessage("Datos de etiquetas"),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Modo del tema"),
    "thumbs": MessageLookupByLibrary.simpleMessage("Miniaturas"),
    "today": MessageLookupByLibrary.simpleMessage("Hoy"),
    "translated": MessageLookupByLibrary.simpleMessage("Traducido"),
    "translating": MessageLookupByLibrary.simpleMessage("Traduciendo…"),
    "translation_api_key": MessageLookupByLibrary.simpleMessage("Clave de API"),
    "translation_api_url": MessageLookupByLibrary.simpleMessage(
      "URL de la API",
    ),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "Caché de traducciones borrada",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage(
      "Modo de visualización",
    ),
    "translation_failed": MessageLookupByLibrary.simpleMessage(
      "Error de traducción",
    ),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "Usa el servicio de traducción integrado o Google Translate gratuito si no está configurado",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("Modelo"),
    "translation_provider": MessageLookupByLibrary.simpleMessage(
      "Proveedor de traducción",
    ),
    "translation_service_config": MessageLookupByLibrary.simpleMessage(
      "Servicio de traducción",
    ),
    "translation_settings": MessageLookupByLibrary.simpleMessage("Traducción"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage(
      "Usar tinte de galería",
    ),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "Colorear las páginas de la galería según el color de la portada",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage(
      "Usar Google Translate",
    ),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "Omitir LLM y usar Google Translate gratuito directamente",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Usuario"),
    "version": MessageLookupByLibrary.simpleMessage("Versión"),
    "vertical": MessageLookupByLibrary.simpleMessage("Vertical"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage(
      "Pasar página con teclas de volumen",
    ),
    "waterfall": MessageLookupByLibrary.simpleMessage("Cascada"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage(
      "Cascada (compacta)",
    ),
    "webtoon": MessageLookupByLibrary.simpleMessage("Webtoon"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "Permiso solicitado por WebView",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("Ajustar"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Ayer"),
  };
}

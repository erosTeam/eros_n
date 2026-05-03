// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(date) => "Ajouté le ${date}";

  static String m1(total, galleries, pages) =>
      "Requêtes simultanées : ${total} (${galleries} × ${pages}). Très susceptible de déclencher un blocage temporaire du CDN, causant des échecs de téléchargement et des miniatures manquantes. Réduisez la simultanéité.";

  static String m2(total, galleries, pages) =>
      "Requêtes simultanées : ${total} (${galleries} × ${pages}). Cela peut déclencher une limitation du CDN lors de téléchargements en masse. Réduisez la simultanéité si les téléchargements échouent.";

  static String m3(downloaded, total) => "${downloaded} / ${total} pages";

  static String m4(count) => "${count} pages";

  static String m5(error) => "Échec de la mise à jour du favori : ${error}";

  static String m6(version) =>
      "Nécessite le téléchargement des données de traduction des tags, version : ${version}";

  static String m7(count) => "${count} traductions en cache";

  static String m8(kind) => "WebView a demandé l\'autorisation \'\'${kind}\'\'";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("À propos"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("Avancé"),
    "all": MessageLookupByLibrary.simpleMessage("Tout"),
    "allow": MessageLookupByLibrary.simpleMessage("Autoriser"),
    "always": MessageLookupByLibrary.simpleMessage("Toujours"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("Apparence"),
    "author": MessageLookupByLibrary.simpleMessage("Auteur"),
    "auto": MessageLookupByLibrary.simpleMessage("Auto"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage(
      "Intervalle de lecture automatique",
    ),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage(
      "Traduction automatique des commentaires",
    ),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("Bilingue"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "Ceci est le texte du commentaire traduit.",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage("Style bilingue"),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage("Compact"),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage(
      "Séparateur",
    ),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage(
      "Italique discret",
    ),
    "cache_calculating": MessageLookupByLibrary.simpleMessage(
      "Calcul en cours…",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("Chinois"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("Vider le cache"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Vider toutes les données en cache ? (réponses HTTP, images)",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage(
      "Effacer l\'historique",
    ),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "Voulez-vous vraiment effacer tout l\'historique ?",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "Effacer tout l\'historique de recherche ?",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage(
      "Vider le cache de traduction",
    ),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Vider toutes les traductions en cache ?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage(
      "Détection de lien dans le presse-papiers",
    ),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "Le commentaire doit contenir plus de 10 caractères",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage(
      "Traduction des commentaires",
    ),
    "comments": MessageLookupByLibrary.simpleMessage("Commentaires"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage(
      "Téléchargements simultanés",
    ),
    "cover_blur": MessageLookupByLibrary.simpleMessage("Flou de couverture"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage(
      "Flouter l\'image de couverture dans la liste",
    ),
    "curl_vertical": MessageLookupByLibrary.simpleMessage(
      "Défilement vertical",
    ),
    "current_path": MessageLookupByLibrary.simpleMessage("Chemin actuel"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage(
      "Largeur de mise en page personnalisée",
    ),
    "custom_provider": MessageLookupByLibrary.simpleMessage("Personnalisé"),
    "dark": MessageLookupByLibrary.simpleMessage("Sombre"),
    "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
    "deny": MessageLookupByLibrary.simpleMessage("Refuser"),
    "display": MessageLookupByLibrary.simpleMessage("Affichage"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage(
      "Appuyez deux fois pour quitter",
    ),
    "download": MessageLookupByLibrary.simpleMessage("Télécharger"),
    "download_completed": MessageLookupByLibrary.simpleMessage("Terminé"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Cela supprimera la tâche et tous les fichiers téléchargés. Continuer ?",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "Supprimer le téléchargement",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage(
      "Échec du téléchargement",
    ),
    "download_management": MessageLookupByLibrary.simpleMessage(
      "Téléchargements",
    ),
    "download_path": MessageLookupByLibrary.simpleMessage(
      "Chemin de téléchargement",
    ),
    "download_paused": MessageLookupByLibrary.simpleMessage("En pause"),
    "download_pending": MessageLookupByLibrary.simpleMessage("En attente"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage(
      "Retélécharger",
    ),
    "download_settings": MessageLookupByLibrary.simpleMessage(
      "Paramètres de téléchargement",
    ),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage(
      "En cours de téléchargement",
    ),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("Couleur dynamique"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage(
      "La couleur s\'adaptera au fond d\'écran",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Anglais"),
    "favorite_added": MessageLookupByLibrary.simpleMessage(
      "Ajouté aux favoris",
    ),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage(
      "Retiré des favoris",
    ),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoris"),
    "fetch_models": MessageLookupByLibrary.simpleMessage(
      "Récupérer les modèles",
    ),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage(
      "Échec de la récupération des modèles",
    ),
    "full_screen": MessageLookupByLibrary.simpleMessage("Plein écran"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galerie"),
    "general": MessageLookupByLibrary.simpleMessage("Général"),
    "grid": MessageLookupByLibrary.simpleMessage("Grille"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "Masquer la barre de navigation lors du défilement",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Historique"),
    "home": MessageLookupByLibrary.simpleMessage("Accueil"),
    "japanese": MessageLookupByLibrary.simpleMessage("Japonais"),
    "language": MessageLookupByLibrary.simpleMessage("Langue"),
    "language_name": MessageLookupByLibrary.simpleMessage("Français"),
    "left_to_right": MessageLookupByLibrary.simpleMessage("De gauche à droite"),
    "license": MessageLookupByLibrary.simpleMessage("Licence"),
    "light": MessageLookupByLibrary.simpleMessage("Clair"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("Liquid Glass"),
    "list": MessageLookupByLibrary.simpleMessage("Liste"),
    "list_model": MessageLookupByLibrary.simpleMessage("Mode de liste"),
    "list_style": MessageLookupByLibrary.simpleMessage("Style de liste"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage(
      "Échec du chargement",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Connexion"),
    "login_by_web": MessageLookupByLibrary.simpleMessage(
      "Connexion via le Web",
    ),
    "login_invalid": MessageLookupByLibrary.simpleMessage(
      "Identifiants invalides",
    ),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "La connexion nécessite un captcha",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage(
      "Voulez-vous vraiment vous déconnecter ?",
    ),
    "manual_input": MessageLookupByLibrary.simpleMessage("Saisie manuelle"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "Galeries simultanées",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage(
      "Pages par galerie",
    ),
    "more": MessageLookupByLibrary.simpleMessage("Plus"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("Plus comme ça"),
    "never": MessageLookupByLibrary.simpleMessage("Jamais"),
    "newest": MessageLookupByLibrary.simpleMessage("Récents"),
    "no_downloads": MessageLookupByLibrary.simpleMessage(
      "Aucun téléchargement",
    ),
    "no_result": MessageLookupByLibrary.simpleMessage("Aucun résultat"),
    "none": MessageLookupByLibrary.simpleMessage("Aucun"),
    "not_initialized": MessageLookupByLibrary.simpleMessage("Non initialisé"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Ouvrir dans le navigateur",
    ),
    "open_supported_links": MessageLookupByLibrary.simpleMessage(
      "Ouvrir les liens pris en charge",
    ),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "À partir d\'Android 12, les applications ne peuvent gérer les liens web que si elles sont approuvées. Sinon, le navigateur par défaut sera utilisé. Vous pouvez l\'approuver manuellement ici",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "Vous pouvez aussi pincer pour ajuster sur la page",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage(
      "Veuillez d\'abord vous connecter",
    ),
    "please_login_web": MessageLookupByLibrary.simpleMessage(
      "Veuillez vous connecter via le Web",
    ),
    "popular": MessageLookupByLibrary.simpleMessage("Populaire"),
    "popular_all": MessageLookupByLibrary.simpleMessage("Populaire (tout)"),
    "popular_month": MessageLookupByLibrary.simpleMessage("Populaire ce mois"),
    "popular_today": MessageLookupByLibrary.simpleMessage(
      "Populaire aujourd\'hui",
    ),
    "popular_week": MessageLookupByLibrary.simpleMessage(
      "Populaire cette semaine",
    ),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage(
      "Nombre de pages à précharger",
    ),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "Appuyez à nouveau pour quitter",
    ),
    "read": MessageLookupByLibrary.simpleMessage("Lire"),
    "read_model": MessageLookupByLibrary.simpleMessage("Mode de lecture"),
    "recent": MessageLookupByLibrary.simpleMessage("Récent"),
    "recent_searches": MessageLookupByLibrary.simpleMessage(
      "Recherches récentes",
    ),
    "register": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
    "replace_original": MessageLookupByLibrary.simpleMessage(
      "Remplacer l\'original",
    ),
    "reset_to_default": MessageLookupByLibrary.simpleMessage(
      "Réinitialiser par défaut",
    ),
    "resume": MessageLookupByLibrary.simpleMessage("Reprendre"),
    "right_to_left": MessageLookupByLibrary.simpleMessage("De droite à gauche"),
    "search": MessageLookupByLibrary.simpleMessage("Rechercher"),
    "security_challenge": MessageLookupByLibrary.simpleMessage(
      "Vérification de sécurité",
    ),
    "session_expired": MessageLookupByLibrary.simpleMessage(
      "Session expirée, veuillez vous reconnecter",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
    "share": MessageLookupByLibrary.simpleMessage("Partager"),
    "show_less": MessageLookupByLibrary.simpleMessage("Afficher moins"),
    "show_more": MessageLookupByLibrary.simpleMessage("Afficher plus"),
    "show_tags": MessageLookupByLibrary.simpleMessage("Afficher les tags"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "Afficher les tags dans la liste (nécessite le téléchargement des données)",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("Ligne unique"),
    "sort_by": MessageLookupByLibrary.simpleMessage("Trier par"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage(
      "Date (plus récent)",
    ),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage(
      "Date (plus ancien)",
    ),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("Titre (A–Z)"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("Titre (Z–A)"),
    "system": MessageLookupByLibrary.simpleMessage("Système"),
    "tag": MessageLookupByLibrary.simpleMessage("Tag"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage(
      "Disposition des tags sur l\'élément",
    ),
    "tag_translation": MessageLookupByLibrary.simpleMessage(
      "Traduction des tags",
    ),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "Échec de la mise à jour des données de traduction",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "Données de traduction mises à jour",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "Téléchargement des données de traduction…",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("Artistes"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("Catégories"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("Personnages"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("Groupes"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("Langues"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("Parodies"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("Tags"),
    "tags_data": MessageLookupByLibrary.simpleMessage("Données des tags"),
    "theme": MessageLookupByLibrary.simpleMessage("Thème"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Mode du thème"),
    "thumbs": MessageLookupByLibrary.simpleMessage("Miniatures"),
    "today": MessageLookupByLibrary.simpleMessage("Aujourd\'hui"),
    "translated": MessageLookupByLibrary.simpleMessage("Traduit"),
    "translating": MessageLookupByLibrary.simpleMessage("Traduction en cours…"),
    "translation_api_key": MessageLookupByLibrary.simpleMessage("Clé API"),
    "translation_api_url": MessageLookupByLibrary.simpleMessage(
      "URL de l\'API",
    ),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "Cache de traduction vidé",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage(
      "Affichage de la traduction",
    ),
    "translation_failed": MessageLookupByLibrary.simpleMessage(
      "Échec de la traduction",
    ),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "Utilise le service de traduction intégré ou Google Traduction gratuit si non configuré",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("Modèle"),
    "translation_provider": MessageLookupByLibrary.simpleMessage(
      "Fournisseur de traduction",
    ),
    "translation_service_config": MessageLookupByLibrary.simpleMessage(
      "Service de traduction",
    ),
    "translation_settings": MessageLookupByLibrary.simpleMessage("Traduction"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage(
      "Teinte de galerie",
    ),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "Teinter les pages de la galerie selon la couleur de la couverture",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage(
      "Utiliser Google Traduction",
    ),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "Ignorer le LLM et utiliser directement Google Traduction gratuit",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "vertical": MessageLookupByLibrary.simpleMessage("Vertical"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage(
      "Tourner la page avec les touches de volume",
    ),
    "waterfall": MessageLookupByLibrary.simpleMessage("Cascade"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage(
      "Cascade (compact)",
    ),
    "webtoon": MessageLookupByLibrary.simpleMessage("Webtoon"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "Autorisation WebView demandée",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("Retour à la ligne"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Hier"),
  };
}

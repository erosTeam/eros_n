// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(date) => "Adicionado em ${date}";

  static String m1(total, galleries, pages) =>
      "Total de requisições simultâneas: ${total} (${galleries} × ${pages}). Muito provável de causar bloqueio temporário do CDN, resultando em falhas de download e miniaturas quebradas. Reduza a simultaneidade.";

  static String m2(total, galleries, pages) =>
      "Total de requisições simultâneas: ${total} (${galleries} × ${pages}). Isso pode acionar limitação do CDN durante downloads em massa. Reduza a simultaneidade se os downloads falharem.";

  static String m3(downloaded, total) => "${downloaded} / ${total} páginas";

  static String m4(count) => "${count} páginas";

  static String m5(error) => "Falha ao atualizar favorito: ${error}";

  static String m6(version) =>
      "É necessário baixar os dados de tradução de tags, versão: ${version}";

  static String m7(count) => "${count} traduções em cache";

  static String m8(kind) => "O WebView solicitou a permissão \'\'${kind}\'\'";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Sobre"),
    "added_on": m0,
    "advanced": MessageLookupByLibrary.simpleMessage("Avançado"),
    "all": MessageLookupByLibrary.simpleMessage("Todos"),
    "allow": MessageLookupByLibrary.simpleMessage("Permitir"),
    "always": MessageLookupByLibrary.simpleMessage("Sempre"),
    "app_title": MessageLookupByLibrary.simpleMessage("Eros-N"),
    "appearance": MessageLookupByLibrary.simpleMessage("Aparência"),
    "author": MessageLookupByLibrary.simpleMessage("Autor"),
    "auto": MessageLookupByLibrary.simpleMessage("Automático"),
    "auto_read_interval": MessageLookupByLibrary.simpleMessage(
      "Intervalo de leitura automática",
    ),
    "auto_translate_comments": MessageLookupByLibrary.simpleMessage(
      "Traduzir comentários automaticamente",
    ),
    "bilingual_display": MessageLookupByLibrary.simpleMessage("Bilíngue"),
    "bilingual_preview_original": MessageLookupByLibrary.simpleMessage(
      "This is the original comment text.",
    ),
    "bilingual_preview_translated": MessageLookupByLibrary.simpleMessage(
      "Este é o texto traduzido do comentário.",
    ),
    "bilingual_style": MessageLookupByLibrary.simpleMessage("Estilo bilíngue"),
    "bilingual_style_compact": MessageLookupByLibrary.simpleMessage("Compacto"),
    "bilingual_style_divider": MessageLookupByLibrary.simpleMessage("Divisor"),
    "bilingual_style_subtle": MessageLookupByLibrary.simpleMessage(
      "Itálico sutil",
    ),
    "cache_calculating": MessageLookupByLibrary.simpleMessage("Calculando..."),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cdn_warn_high": m1,
    "cdn_warn_moderate": m2,
    "chinese": MessageLookupByLibrary.simpleMessage("Chinês"),
    "clear_cache": MessageLookupByLibrary.simpleMessage("Limpar cache"),
    "clear_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Limpar todos os dados em cache? (respostas HTTP, imagens)",
    ),
    "clear_history": MessageLookupByLibrary.simpleMessage("Limpar histórico"),
    "clear_history_tip": MessageLookupByLibrary.simpleMessage(
      "Tem certeza que deseja limpar todo o histórico?",
    ),
    "clear_search_history_tip": MessageLookupByLibrary.simpleMessage(
      "Limpar todo o histórico de busca?",
    ),
    "clear_translation_cache": MessageLookupByLibrary.simpleMessage(
      "Limpar cache de tradução",
    ),
    "clear_translation_cache_tip": MessageLookupByLibrary.simpleMessage(
      "Limpar todas as traduções em cache?",
    ),
    "clipboard_detection": MessageLookupByLibrary.simpleMessage(
      "Detectar links na área de transferência",
    ),
    "comment_length_error": MessageLookupByLibrary.simpleMessage(
      "O comentário deve ter mais de 10 caracteres",
    ),
    "comment_translation": MessageLookupByLibrary.simpleMessage(
      "Tradução de comentários",
    ),
    "comments": MessageLookupByLibrary.simpleMessage("Comentários"),
    "concurrent_downloads": MessageLookupByLibrary.simpleMessage(
      "Downloads simultâneos",
    ),
    "cover_blur": MessageLookupByLibrary.simpleMessage("Desfocar capa"),
    "cover_blur_tip": MessageLookupByLibrary.simpleMessage(
      "Desfocar capa na lista",
    ),
    "curl_vertical": MessageLookupByLibrary.simpleMessage("Virar página"),
    "current_path": MessageLookupByLibrary.simpleMessage("Caminho atual"),
    "custom_layout_width": MessageLookupByLibrary.simpleMessage(
      "Largura personalizada do layout",
    ),
    "custom_provider": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "dark": MessageLookupByLibrary.simpleMessage("Escuro"),
    "delete": MessageLookupByLibrary.simpleMessage("Excluir"),
    "deny": MessageLookupByLibrary.simpleMessage("Negar"),
    "display": MessageLookupByLibrary.simpleMessage("Exibição"),
    "double_back_to_exit": MessageLookupByLibrary.simpleMessage(
      "Toque duas vezes para sair",
    ),
    "download": MessageLookupByLibrary.simpleMessage("Baixar"),
    "download_completed": MessageLookupByLibrary.simpleMessage("Concluído"),
    "download_delete_confirm_message": MessageLookupByLibrary.simpleMessage(
      "Isso excluirá o registro e todos os arquivos baixados. Continuar?",
    ),
    "download_delete_confirm_title": MessageLookupByLibrary.simpleMessage(
      "Excluir download",
    ),
    "download_failed": MessageLookupByLibrary.simpleMessage(
      "Falha no download",
    ),
    "download_management": MessageLookupByLibrary.simpleMessage("Downloads"),
    "download_path": MessageLookupByLibrary.simpleMessage(
      "Caminho do download",
    ),
    "download_paused": MessageLookupByLibrary.simpleMessage("Pausado"),
    "download_pending": MessageLookupByLibrary.simpleMessage("Pendente"),
    "download_progress": m3,
    "download_redownload": MessageLookupByLibrary.simpleMessage(
      "Baixar novamente",
    ),
    "download_settings": MessageLookupByLibrary.simpleMessage(
      "Configurações de download",
    ),
    "download_total_pages": m4,
    "downloading": MessageLookupByLibrary.simpleMessage("Baixando"),
    "dynamic_color": MessageLookupByLibrary.simpleMessage("Cor dinâmica"),
    "dynamic_color_tip": MessageLookupByLibrary.simpleMessage(
      "A cor muda de acordo com o papel de parede",
    ),
    "english": MessageLookupByLibrary.simpleMessage("Inglês"),
    "favorite_added": MessageLookupByLibrary.simpleMessage(
      "Adicionado aos favoritos",
    ),
    "favorite_failed": m5,
    "favorite_removed": MessageLookupByLibrary.simpleMessage(
      "Removido dos favoritos",
    ),
    "favorites": MessageLookupByLibrary.simpleMessage("Favoritos"),
    "fetch_models": MessageLookupByLibrary.simpleMessage("Buscar modelos"),
    "fetch_models_failed": MessageLookupByLibrary.simpleMessage(
      "Falha ao buscar modelos",
    ),
    "full_screen": MessageLookupByLibrary.simpleMessage("Tela cheia"),
    "gallery": MessageLookupByLibrary.simpleMessage("Galeria"),
    "general": MessageLookupByLibrary.simpleMessage("Geral"),
    "grid": MessageLookupByLibrary.simpleMessage("Grade"),
    "hide_bottom_navigation_on_scroll": MessageLookupByLibrary.simpleMessage(
      "Ocultar navegação ao rolar",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Histórico"),
    "home": MessageLookupByLibrary.simpleMessage("Início"),
    "japanese": MessageLookupByLibrary.simpleMessage("Japonês"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "language_name": MessageLookupByLibrary.simpleMessage("Português"),
    "left_to_right": MessageLookupByLibrary.simpleMessage(
      "Esquerda para direita",
    ),
    "license": MessageLookupByLibrary.simpleMessage("Licença"),
    "light": MessageLookupByLibrary.simpleMessage("Claro"),
    "liquid_glass": MessageLookupByLibrary.simpleMessage("Liquid Glass"),
    "list": MessageLookupByLibrary.simpleMessage("Lista"),
    "list_model": MessageLookupByLibrary.simpleMessage("Modelo de lista"),
    "list_style": MessageLookupByLibrary.simpleMessage("Estilo da lista"),
    "load_more_fail": MessageLookupByLibrary.simpleMessage(
      "Falha ao carregar mais",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Entrar"),
    "login_by_web": MessageLookupByLibrary.simpleMessage(
      "Entrar pelo navegador",
    ),
    "login_invalid": MessageLookupByLibrary.simpleMessage("Login inválido"),
    "login_need_captcha": MessageLookupByLibrary.simpleMessage(
      "Login requer captcha",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Sair"),
    "logout_confirm": MessageLookupByLibrary.simpleMessage(
      "Tem certeza que deseja sair?",
    ),
    "manual_input": MessageLookupByLibrary.simpleMessage("Inserir manualmente"),
    "max_concurrent_galleries": MessageLookupByLibrary.simpleMessage(
      "Galerias simultâneas",
    ),
    "max_concurrent_pages": MessageLookupByLibrary.simpleMessage(
      "Páginas por galeria",
    ),
    "more": MessageLookupByLibrary.simpleMessage("Mais"),
    "more_like_this": MessageLookupByLibrary.simpleMessage("Semelhantes"),
    "never": MessageLookupByLibrary.simpleMessage("Nunca"),
    "newest": MessageLookupByLibrary.simpleMessage("Mais recentes"),
    "no_downloads": MessageLookupByLibrary.simpleMessage("Nenhum download"),
    "no_result": MessageLookupByLibrary.simpleMessage("Sem resultados"),
    "none": MessageLookupByLibrary.simpleMessage("Nenhum"),
    "not_initialized": MessageLookupByLibrary.simpleMessage("Não inicializado"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "open_in_browser": MessageLookupByLibrary.simpleMessage(
      "Abrir no navegador",
    ),
    "open_supported_links": MessageLookupByLibrary.simpleMessage(
      "Abrir links compatíveis",
    ),
    "open_supported_links_tip": MessageLookupByLibrary.simpleMessage(
      "A partir do Android 12, apps só podem abrir links da web com aprovação. Caso contrário, o navegador padrão será usado. Você pode aprovar manualmente aqui",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Senha"),
    "pinch_to_zoom_hint": MessageLookupByLibrary.simpleMessage(
      "Você também pode pinçar para ajustar na página",
    ),
    "please_login_first": MessageLookupByLibrary.simpleMessage(
      "Faça login primeiro",
    ),
    "please_login_web": MessageLookupByLibrary.simpleMessage(
      "Faça login pelo navegador",
    ),
    "popular": MessageLookupByLibrary.simpleMessage("Popular"),
    "popular_all": MessageLookupByLibrary.simpleMessage("Popular geral"),
    "popular_month": MessageLookupByLibrary.simpleMessage("Popular no mês"),
    "popular_today": MessageLookupByLibrary.simpleMessage("Popular hoje"),
    "popular_week": MessageLookupByLibrary.simpleMessage("Popular na semana"),
    "preload_pages_count": MessageLookupByLibrary.simpleMessage(
      "Páginas pré-carregadas",
    ),
    "press_back_again_to_exit": MessageLookupByLibrary.simpleMessage(
      "Pressione voltar novamente para sair",
    ),
    "read": MessageLookupByLibrary.simpleMessage("Ler"),
    "read_model": MessageLookupByLibrary.simpleMessage("Modo de leitura"),
    "recent": MessageLookupByLibrary.simpleMessage("Recentes"),
    "recent_searches": MessageLookupByLibrary.simpleMessage("Buscas recentes"),
    "register": MessageLookupByLibrary.simpleMessage("Cadastrar"),
    "replace_original": MessageLookupByLibrary.simpleMessage(
      "Substituir original",
    ),
    "reset_to_default": MessageLookupByLibrary.simpleMessage(
      "Restaurar padrão",
    ),
    "resume": MessageLookupByLibrary.simpleMessage("Continuar"),
    "right_to_left": MessageLookupByLibrary.simpleMessage(
      "Direita para esquerda",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Buscar"),
    "security_challenge": MessageLookupByLibrary.simpleMessage(
      "Verificação de segurança",
    ),
    "session_expired": MessageLookupByLibrary.simpleMessage(
      "Sessão expirada, faça login novamente",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
    "share": MessageLookupByLibrary.simpleMessage("Compartilhar"),
    "show_less": MessageLookupByLibrary.simpleMessage("Mostrar menos"),
    "show_more": MessageLookupByLibrary.simpleMessage("Mostrar mais"),
    "show_tags": MessageLookupByLibrary.simpleMessage("Mostrar tags"),
    "show_tags_tip": MessageLookupByLibrary.simpleMessage(
      "Mostrar tags na lista, é necessário baixar os dados de tags",
    ),
    "single_line": MessageLookupByLibrary.simpleMessage("Linha única"),
    "sort_by": MessageLookupByLibrary.simpleMessage("Ordenar por"),
    "sort_date_newest": MessageLookupByLibrary.simpleMessage(
      "Data (mais recente)",
    ),
    "sort_date_oldest": MessageLookupByLibrary.simpleMessage(
      "Data (mais antigo)",
    ),
    "sort_title_az": MessageLookupByLibrary.simpleMessage("Título (A–Z)"),
    "sort_title_za": MessageLookupByLibrary.simpleMessage("Título (Z–A)"),
    "system": MessageLookupByLibrary.simpleMessage("Sistema"),
    "tag": MessageLookupByLibrary.simpleMessage("Tag"),
    "tag_layout_on_item": MessageLookupByLibrary.simpleMessage(
      "Layout de tags no item",
    ),
    "tag_translation": MessageLookupByLibrary.simpleMessage("Tradução de tags"),
    "tag_translation_tip": m6,
    "tag_translation_update_failed": MessageLookupByLibrary.simpleMessage(
      "Falha ao atualizar dados de tradução",
    ),
    "tag_translation_updated": MessageLookupByLibrary.simpleMessage(
      "Dados de tradução atualizados",
    ),
    "tag_translation_updating": MessageLookupByLibrary.simpleMessage(
      "Baixando dados de tradução...",
    ),
    "tag_type_artists": MessageLookupByLibrary.simpleMessage("Artistas"),
    "tag_type_categories": MessageLookupByLibrary.simpleMessage("Categorias"),
    "tag_type_characters": MessageLookupByLibrary.simpleMessage("Personagens"),
    "tag_type_groups": MessageLookupByLibrary.simpleMessage("Grupos"),
    "tag_type_languages": MessageLookupByLibrary.simpleMessage("Idiomas"),
    "tag_type_parodies": MessageLookupByLibrary.simpleMessage("Paródias"),
    "tag_type_tags": MessageLookupByLibrary.simpleMessage("Tags"),
    "tags_data": MessageLookupByLibrary.simpleMessage("Dados de tags"),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Modo do tema"),
    "thumbs": MessageLookupByLibrary.simpleMessage("Miniaturas"),
    "today": MessageLookupByLibrary.simpleMessage("Hoje"),
    "translated": MessageLookupByLibrary.simpleMessage("Traduzido"),
    "translating": MessageLookupByLibrary.simpleMessage("Traduzindo..."),
    "translation_api_key": MessageLookupByLibrary.simpleMessage("Chave da API"),
    "translation_api_url": MessageLookupByLibrary.simpleMessage("URL da API"),
    "translation_cache_cleared": MessageLookupByLibrary.simpleMessage(
      "Cache de tradução limpo",
    ),
    "translation_cache_entries": m7,
    "translation_display_mode": MessageLookupByLibrary.simpleMessage(
      "Exibição da tradução",
    ),
    "translation_failed": MessageLookupByLibrary.simpleMessage(
      "Falha na tradução",
    ),
    "translation_hint": MessageLookupByLibrary.simpleMessage(
      "Usa serviço de tradução integrado ou Google Translate gratuito quando não configurado",
    ),
    "translation_model": MessageLookupByLibrary.simpleMessage("Modelo"),
    "translation_provider": MessageLookupByLibrary.simpleMessage(
      "Provedor de tradução",
    ),
    "translation_service_config": MessageLookupByLibrary.simpleMessage(
      "Serviço de tradução",
    ),
    "translation_settings": MessageLookupByLibrary.simpleMessage("Tradução"),
    "use_gallery_tint": MessageLookupByLibrary.simpleMessage("Colorir galeria"),
    "use_gallery_tint_tip": MessageLookupByLibrary.simpleMessage(
      "Colorir páginas da galeria com base na cor da capa",
    ),
    "use_google_translate": MessageLookupByLibrary.simpleMessage(
      "Usar Google Translate",
    ),
    "use_google_translate_tip": MessageLookupByLibrary.simpleMessage(
      "Usar Google Translate gratuito diretamente, sem passar pelo LLM",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Nome de usuário"),
    "version": MessageLookupByLibrary.simpleMessage("Versão"),
    "vertical": MessageLookupByLibrary.simpleMessage("Vertical"),
    "volume_key_turn_page": MessageLookupByLibrary.simpleMessage(
      "Virar página com botões de volume",
    ),
    "waterfall": MessageLookupByLibrary.simpleMessage("Cascata"),
    "waterfall_compact": MessageLookupByLibrary.simpleMessage(
      "Cascata (compacta)",
    ),
    "webtoon": MessageLookupByLibrary.simpleMessage("Webtoon"),
    "webview_permission_content": m8,
    "webview_permission_title": MessageLookupByLibrary.simpleMessage(
      "Permissão solicitada pelo WebView",
    ),
    "wrap": MessageLookupByLibrary.simpleMessage("Quebra de linha"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Ontem"),
  };
}

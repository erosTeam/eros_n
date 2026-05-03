// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(
      _current != null,
      'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(
      instance != null,
      'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `English`
  String get language_name {
    return Intl.message('English', name: 'language_name', desc: '', args: []);
  }

  /// `Eros-N`
  String get app_title {
    return Intl.message('Eros-N', name: 'app_title', desc: '', args: []);
  }

  /// `Popular`
  String get popular {
    return Intl.message('Popular', name: 'popular', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Newest`
  String get newest {
    return Intl.message('Newest', name: 'newest', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Download`
  String get download {
    return Intl.message('Download', name: 'download', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Login by Web`
  String get login_by_web {
    return Intl.message(
      'Login by Web',
      name: 'login_by_web',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// `Thumbs`
  String get thumbs {
    return Intl.message('Thumbs', name: 'thumbs', desc: '', args: []);
  }

  /// `More like this`
  String get more_like_this {
    return Intl.message(
      'More like this',
      name: 'more_like_this',
      desc: '',
      args: [],
    );
  }

  /// `Read`
  String get read {
    return Intl.message('Read', name: 'read', desc: '', args: []);
  }

  /// `Resume`
  String get resume {
    return Intl.message('Resume', name: 'resume', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Please login first`
  String get please_login_first {
    return Intl.message(
      'Please login first',
      name: 'please_login_first',
      desc: '',
      args: [],
    );
  }

  /// `Login need captcha`
  String get login_need_captcha {
    return Intl.message(
      'Login need captcha',
      name: 'login_need_captcha',
      desc: '',
      args: [],
    );
  }

  /// `Login invalid`
  String get login_invalid {
    return Intl.message(
      'Login invalid',
      name: 'login_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Please login with web`
  String get please_login_web {
    return Intl.message(
      'Please login with web',
      name: 'please_login_web',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Never`
  String get never {
    return Intl.message('Never', name: 'never', desc: '', args: []);
  }

  /// `Always`
  String get always {
    return Intl.message('Always', name: 'always', desc: '', args: []);
  }

  /// `Auto`
  String get auto {
    return Intl.message('Auto', name: 'auto', desc: '', args: []);
  }

  /// `Comments`
  String get comments {
    return Intl.message('Comments', name: 'comments', desc: '', args: []);
  }

  /// `Parodies`
  String get tag_type_parodies {
    return Intl.message(
      'Parodies',
      name: 'tag_type_parodies',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get tag_type_characters {
    return Intl.message(
      'Characters',
      name: 'tag_type_characters',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get tag_type_tags {
    return Intl.message('Tags', name: 'tag_type_tags', desc: '', args: []);
  }

  /// `Artists`
  String get tag_type_artists {
    return Intl.message(
      'Artists',
      name: 'tag_type_artists',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get tag_type_groups {
    return Intl.message('Groups', name: 'tag_type_groups', desc: '', args: []);
  }

  /// `Languages`
  String get tag_type_languages {
    return Intl.message(
      'Languages',
      name: 'tag_type_languages',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get tag_type_categories {
    return Intl.message(
      'Categories',
      name: 'tag_type_categories',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message('Recent', name: 'recent', desc: '', args: []);
  }

  /// `Popular Today`
  String get popular_today {
    return Intl.message(
      'Popular Today',
      name: 'popular_today',
      desc: '',
      args: [],
    );
  }

  /// `Popular Week`
  String get popular_week {
    return Intl.message(
      'Popular Week',
      name: 'popular_week',
      desc: '',
      args: [],
    );
  }

  /// `Popular Month`
  String get popular_month {
    return Intl.message(
      'Popular Month',
      name: 'popular_month',
      desc: '',
      args: [],
    );
  }

  /// `Popular All`
  String get popular_all {
    return Intl.message('Popular All', name: 'popular_all', desc: '', args: []);
  }

  /// `Clear History`
  String get clear_history {
    return Intl.message(
      'Clear History',
      name: 'clear_history',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to clear all history?`
  String get clear_history_tip {
    return Intl.message(
      'Are you sure to clear all history?',
      name: 'clear_history_tip',
      desc: '',
      args: [],
    );
  }

  /// `Recent searches`
  String get recent_searches {
    return Intl.message(
      'Recent searches',
      name: 'recent_searches',
      desc: '',
      args: [],
    );
  }

  /// `Clear all search history?`
  String get clear_search_history_tip {
    return Intl.message(
      'Clear all search history?',
      name: 'clear_search_history_tip',
      desc: '',
      args: [],
    );
  }

  /// `Left to Right`
  String get left_to_right {
    return Intl.message(
      'Left to Right',
      name: 'left_to_right',
      desc: '',
      args: [],
    );
  }

  /// `Right to Left`
  String get right_to_left {
    return Intl.message(
      'Right to Left',
      name: 'right_to_left',
      desc: '',
      args: [],
    );
  }

  /// `Webtoon`
  String get webtoon {
    return Intl.message('Webtoon', name: 'webtoon', desc: '', args: []);
  }

  /// `Vertical`
  String get vertical {
    return Intl.message('Vertical', name: 'vertical', desc: '', args: []);
  }

  /// `Curl Vertical`
  String get curl_vertical {
    return Intl.message(
      'Curl Vertical',
      name: 'curl_vertical',
      desc: '',
      args: [],
    );
  }

  /// `Full Screen`
  String get full_screen {
    return Intl.message('Full Screen', name: 'full_screen', desc: '', args: []);
  }

  /// `Display`
  String get display {
    return Intl.message('Display', name: 'display', desc: '', args: []);
  }

  /// `Theme Mode`
  String get theme_mode {
    return Intl.message('Theme Mode', name: 'theme_mode', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Dynamic Color`
  String get dynamic_color {
    return Intl.message(
      'Dynamic Color',
      name: 'dynamic_color',
      desc: '',
      args: [],
    );
  }

  /// `Color will change according to the wallpaper`
  String get dynamic_color_tip {
    return Intl.message(
      'Color will change according to the wallpaper',
      name: 'dynamic_color_tip',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `List Style`
  String get list_style {
    return Intl.message('List Style', name: 'list_style', desc: '', args: []);
  }

  /// `Tag Translation`
  String get tag_translation {
    return Intl.message(
      'Tag Translation',
      name: 'tag_translation',
      desc: '',
      args: [],
    );
  }

  /// `need download tag translation data, version: {version}`
  String tag_translation_tip(Object version) {
    return Intl.message(
      'need download tag translation data, version: $version',
      name: 'tag_translation_tip',
      desc: '',
      args: [version],
    );
  }

  /// `Downloading translation data...`
  String get tag_translation_updating {
    return Intl.message(
      'Downloading translation data...',
      name: 'tag_translation_updating',
      desc: '',
      args: [],
    );
  }

  /// `Translation data updated`
  String get tag_translation_updated {
    return Intl.message(
      'Translation data updated',
      name: 'tag_translation_updated',
      desc: '',
      args: [],
    );
  }

  /// `Translation data update failed`
  String get tag_translation_update_failed {
    return Intl.message(
      'Translation data update failed',
      name: 'tag_translation_update_failed',
      desc: '',
      args: [],
    );
  }

  /// `Tags Data`
  String get tags_data {
    return Intl.message('Tags Data', name: 'tags_data', desc: '', args: []);
  }

  /// `Show Tags`
  String get show_tags {
    return Intl.message('Show Tags', name: 'show_tags', desc: '', args: []);
  }

  /// `Show tags in list, need download tags data`
  String get show_tags_tip {
    return Intl.message(
      'Show tags in list, need download tags data',
      name: 'show_tags_tip',
      desc: '',
      args: [],
    );
  }

  /// `Tag Layout on Item`
  String get tag_layout_on_item {
    return Intl.message(
      'Tag Layout on Item',
      name: 'tag_layout_on_item',
      desc: '',
      args: [],
    );
  }

  /// `Wrap`
  String get wrap {
    return Intl.message('Wrap', name: 'wrap', desc: '', args: []);
  }

  /// `Single Line`
  String get single_line {
    return Intl.message('Single Line', name: 'single_line', desc: '', args: []);
  }

  /// `Cover Blur`
  String get cover_blur {
    return Intl.message('Cover Blur', name: 'cover_blur', desc: '', args: []);
  }

  /// `List Model`
  String get list_model {
    return Intl.message('List Model', name: 'list_model', desc: '', args: []);
  }

  /// `List`
  String get list {
    return Intl.message('List', name: 'list', desc: '', args: []);
  }

  /// `Grid`
  String get grid {
    return Intl.message('Grid', name: 'grid', desc: '', args: []);
  }

  /// `Waterfall Flow`
  String get waterfall {
    return Intl.message(
      'Waterfall Flow',
      name: 'waterfall',
      desc: '',
      args: [],
    );
  }

  /// `Waterfall Flow (Compact)`
  String get waterfall_compact {
    return Intl.message(
      'Waterfall Flow (Compact)',
      name: 'waterfall_compact',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message('Advanced', name: 'advanced', desc: '', args: []);
  }

  /// `Tag`
  String get tag {
    return Intl.message('Tag', name: 'tag', desc: '', args: []);
  }

  /// `Read Model`
  String get read_model {
    return Intl.message('Read Model', name: 'read_model', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Hide Bottom Navigation on Scroll`
  String get hide_bottom_navigation_on_scroll {
    return Intl.message(
      'Hide Bottom Navigation on Scroll',
      name: 'hide_bottom_navigation_on_scroll',
      desc: '',
      args: [],
    );
  }

  /// `Use Gallery Tint`
  String get use_gallery_tint {
    return Intl.message(
      'Use Gallery Tint',
      name: 'use_gallery_tint',
      desc: '',
      args: [],
    );
  }

  /// `Tint gallery pages base on the color of the cover`
  String get use_gallery_tint_tip {
    return Intl.message(
      'Tint gallery pages base on the color of the cover',
      name: 'use_gallery_tint_tip',
      desc: '',
      args: [],
    );
  }

  /// `Comment must be longer than 10 characters`
  String get comment_length_error {
    return Intl.message(
      'Comment must be longer than 10 characters',
      name: 'comment_length_error',
      desc: '',
      args: [],
    );
  }

  /// `Open supported links`
  String get open_supported_links {
    return Intl.message(
      'Open supported links',
      name: 'open_supported_links',
      desc: '',
      args: [],
    );
  }

  /// `Starting with Android 12, apps can only be used as web link handling apps if they are approved. Otherwise it will be processed using the default browser. You can manually approve it here`
  String get open_supported_links_tip {
    return Intl.message(
      'Starting with Android 12, apps can only be used as web link handling apps if they are approved. Otherwise it will be processed using the default browser. You can manually approve it here',
      name: 'open_supported_links_tip',
      desc: '',
      args: [],
    );
  }

  /// `Volume key to turn page`
  String get volume_key_turn_page {
    return Intl.message(
      'Volume key to turn page',
      name: 'volume_key_turn_page',
      desc: '',
      args: [],
    );
  }

  /// `Auto read interval`
  String get auto_read_interval {
    return Intl.message(
      'Auto read interval',
      name: 'auto_read_interval',
      desc: '',
      args: [],
    );
  }

  /// `Preload pages count`
  String get preload_pages_count {
    return Intl.message(
      'Preload pages count',
      name: 'preload_pages_count',
      desc: '',
      args: [],
    );
  }

  /// `Japanese`
  String get japanese {
    return Intl.message('Japanese', name: 'japanese', desc: '', args: []);
  }

  /// `Chinese`
  String get chinese {
    return Intl.message('Chinese', name: 'chinese', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Translated`
  String get translated {
    return Intl.message('Translated', name: 'translated', desc: '', args: []);
  }

  /// `None`
  String get none {
    return Intl.message('None', name: 'none', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Clipboard link detection`
  String get clipboard_detection {
    return Intl.message(
      'Clipboard link detection',
      name: 'clipboard_detection',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Author`
  String get author {
    return Intl.message('Author', name: 'author', desc: '', args: []);
  }

  /// `License`
  String get license {
    return Intl.message('License', name: 'license', desc: '', args: []);
  }

  /// `Custom Layout Width`
  String get custom_layout_width {
    return Intl.message(
      'Custom Layout Width',
      name: 'custom_layout_width',
      desc: '',
      args: [],
    );
  }

  /// `Showing less`
  String get show_less {
    return Intl.message('Showing less', name: 'show_less', desc: '', args: []);
  }

  /// `Showing more`
  String get show_more {
    return Intl.message('Showing more', name: 'show_more', desc: '', args: []);
  }

  /// `You can also pinch to adjust on the page`
  String get pinch_to_zoom_hint {
    return Intl.message(
      'You can also pinch to adjust on the page',
      name: 'pinch_to_zoom_hint',
      desc: '',
      args: [],
    );
  }

  /// `Liquid Glass`
  String get liquid_glass {
    return Intl.message(
      'Liquid Glass',
      name: 'liquid_glass',
      desc: '',
      args: [],
    );
  }

  /// `Downloads`
  String get download_management {
    return Intl.message(
      'Downloads',
      name: 'download_management',
      desc: '',
      args: [],
    );
  }

  /// `Downloading`
  String get downloading {
    return Intl.message('Downloading', name: 'downloading', desc: '', args: []);
  }

  /// `Paused`
  String get download_paused {
    return Intl.message('Paused', name: 'download_paused', desc: '', args: []);
  }

  /// `Completed`
  String get download_completed {
    return Intl.message(
      'Completed',
      name: 'download_completed',
      desc: '',
      args: [],
    );
  }

  /// `Download Failed`
  String get download_failed {
    return Intl.message(
      'Download Failed',
      name: 'download_failed',
      desc: '',
      args: [],
    );
  }

  /// `Re-download`
  String get download_redownload {
    return Intl.message(
      'Re-download',
      name: 'download_redownload',
      desc: '',
      args: [],
    );
  }

  /// `Delete Download`
  String get download_delete_confirm_title {
    return Intl.message(
      'Delete Download',
      name: 'download_delete_confirm_title',
      desc: '',
      args: [],
    );
  }

  /// `This will delete the task record and all downloaded files. Continue?`
  String get download_delete_confirm_message {
    return Intl.message(
      'This will delete the task record and all downloaded files. Continue?',
      name: 'download_delete_confirm_message',
      desc: '',
      args: [],
    );
  }

  /// `No Downloads`
  String get no_downloads {
    return Intl.message(
      'No Downloads',
      name: 'no_downloads',
      desc: '',
      args: [],
    );
  }

  /// `No Results`
  String get no_result {
    return Intl.message('No Results', name: 'no_result', desc: '', args: []);
  }

  /// `Pending`
  String get download_pending {
    return Intl.message(
      'Pending',
      name: 'download_pending',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `{count} pages`
  String download_total_pages(Object count) {
    return Intl.message(
      '$count pages',
      name: 'download_total_pages',
      desc: '',
      args: [count],
    );
  }

  /// `{downloaded} / {total} pages`
  String download_progress(Object downloaded, Object total) {
    return Intl.message(
      '$downloaded / $total pages',
      name: 'download_progress',
      desc: '',
      args: [downloaded, total],
    );
  }

  /// `Added to favorites`
  String get favorite_added {
    return Intl.message(
      'Added to favorites',
      name: 'favorite_added',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites`
  String get favorite_removed {
    return Intl.message(
      'Removed from favorites',
      name: 'favorite_removed',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update favorite: {error}`
  String favorite_failed(Object error) {
    return Intl.message(
      'Failed to update favorite: $error',
      name: 'favorite_failed',
      desc: '',
      args: [error],
    );
  }

  /// `Sort by`
  String get sort_by {
    return Intl.message('Sort by', name: 'sort_by', desc: '', args: []);
  }

  /// `Date (Newest)`
  String get sort_date_newest {
    return Intl.message(
      'Date (Newest)',
      name: 'sort_date_newest',
      desc: '',
      args: [],
    );
  }

  /// `Date (Oldest)`
  String get sort_date_oldest {
    return Intl.message(
      'Date (Oldest)',
      name: 'sort_date_oldest',
      desc: '',
      args: [],
    );
  }

  /// `Title (A–Z)`
  String get sort_title_az {
    return Intl.message(
      'Title (A–Z)',
      name: 'sort_title_az',
      desc: '',
      args: [],
    );
  }

  /// `Title (Z–A)`
  String get sort_title_za {
    return Intl.message(
      'Title (Z–A)',
      name: 'sort_title_za',
      desc: '',
      args: [],
    );
  }

  /// `Added {date}`
  String added_on(Object date) {
    return Intl.message(
      'Added $date',
      name: 'added_on',
      desc: '',
      args: [date],
    );
  }

  /// `Download Settings`
  String get download_settings {
    return Intl.message(
      'Download Settings',
      name: 'download_settings',
      desc: '',
      args: [],
    );
  }

  /// `Concurrent Downloads`
  String get concurrent_downloads {
    return Intl.message(
      'Concurrent Downloads',
      name: 'concurrent_downloads',
      desc: '',
      args: [],
    );
  }

  /// `Simultaneous galleries`
  String get max_concurrent_galleries {
    return Intl.message(
      'Simultaneous galleries',
      name: 'max_concurrent_galleries',
      desc: '',
      args: [],
    );
  }

  /// `Pages per gallery`
  String get max_concurrent_pages {
    return Intl.message(
      'Pages per gallery',
      name: 'max_concurrent_pages',
      desc: '',
      args: [],
    );
  }

  /// `Download Path`
  String get download_path {
    return Intl.message(
      'Download Path',
      name: 'download_path',
      desc: '',
      args: [],
    );
  }

  /// `Current path`
  String get current_path {
    return Intl.message(
      'Current path',
      name: 'current_path',
      desc: '',
      args: [],
    );
  }

  /// `Reset to default`
  String get reset_to_default {
    return Intl.message(
      'Reset to default',
      name: 'reset_to_default',
      desc: '',
      args: [],
    );
  }

  /// `Total concurrent requests: {total} ({galleries} × {pages}). This may trigger CDN rate limiting during bulk downloads. Reduce concurrency if downloads fail.`
  String cdn_warn_moderate(Object total, Object galleries, Object pages) {
    return Intl.message(
      'Total concurrent requests: $total ($galleries × $pages). This may trigger CDN rate limiting during bulk downloads. Reduce concurrency if downloads fail.',
      name: 'cdn_warn_moderate',
      desc: '',
      args: [total, galleries, pages],
    );
  }

  /// `Clear Cache`
  String get clear_cache {
    return Intl.message('Clear Cache', name: 'clear_cache', desc: '', args: []);
  }

  /// `Clear all cached data? (HTTP responses, images)`
  String get clear_cache_tip {
    return Intl.message(
      'Clear all cached data? (HTTP responses, images)',
      name: 'clear_cache_tip',
      desc: '',
      args: [],
    );
  }

  /// `Calculating...`
  String get cache_calculating {
    return Intl.message(
      'Calculating...',
      name: 'cache_calculating',
      desc: '',
      args: [],
    );
  }

  /// `Open in Browser`
  String get open_in_browser {
    return Intl.message(
      'Open in Browser',
      name: 'open_in_browser',
      desc: '',
      args: [],
    );
  }

  /// `Total concurrent requests: {total} ({galleries} × {pages}). Very likely to trigger a temporary CDN ban, causing download failures and broken thumbnails. Reduce concurrency.`
  String cdn_warn_high(Object total, Object galleries, Object pages) {
    return Intl.message(
      'Total concurrent requests: $total ($galleries × $pages). Very likely to trigger a temporary CDN ban, causing download failures and broken thumbnails. Reduce concurrency.',
      name: 'cdn_warn_high',
      desc: '',
      args: [total, galleries, pages],
    );
  }

  /// `Double back to exit`
  String get double_back_to_exit {
    return Intl.message(
      'Double back to exit',
      name: 'double_back_to_exit',
      desc: '',
      args: [],
    );
  }

  /// `Press back again to exit`
  String get press_back_again_to_exit {
    return Intl.message(
      'Press back again to exit',
      name: 'press_back_again_to_exit',
      desc: '',
      args: [],
    );
  }

  /// `Comment Translation`
  String get comment_translation {
    return Intl.message(
      'Comment Translation',
      name: 'comment_translation',
      desc: '',
      args: [],
    );
  }

  /// `Translation Service`
  String get translation_service_config {
    return Intl.message(
      'Translation Service',
      name: 'translation_service_config',
      desc: '',
      args: [],
    );
  }

  /// `API URL`
  String get translation_api_url {
    return Intl.message(
      'API URL',
      name: 'translation_api_url',
      desc: '',
      args: [],
    );
  }

  /// `API Key`
  String get translation_api_key {
    return Intl.message(
      'API Key',
      name: 'translation_api_key',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get translation_model {
    return Intl.message('Model', name: 'translation_model', desc: '', args: []);
  }

  /// `Uses built-in translation service or free Google Translate when not configured`
  String get translation_hint {
    return Intl.message(
      'Uses built-in translation service or free Google Translate when not configured',
      name: 'translation_hint',
      desc: '',
      args: [],
    );
  }

  /// `Translating...`
  String get translating {
    return Intl.message(
      'Translating...',
      name: 'translating',
      desc: '',
      args: [],
    );
  }

  /// `Translation failed`
  String get translation_failed {
    return Intl.message(
      'Translation failed',
      name: 'translation_failed',
      desc: '',
      args: [],
    );
  }

  /// `Translation Provider`
  String get translation_provider {
    return Intl.message(
      'Translation Provider',
      name: 'translation_provider',
      desc: '',
      args: [],
    );
  }

  /// `Fetch Models`
  String get fetch_models {
    return Intl.message(
      'Fetch Models',
      name: 'fetch_models',
      desc: '',
      args: [],
    );
  }

  /// `Failed to fetch models`
  String get fetch_models_failed {
    return Intl.message(
      'Failed to fetch models',
      name: 'fetch_models_failed',
      desc: '',
      args: [],
    );
  }

  /// `Manual Input`
  String get manual_input {
    return Intl.message(
      'Manual Input',
      name: 'manual_input',
      desc: '',
      args: [],
    );
  }

  /// `Auto translate comments`
  String get auto_translate_comments {
    return Intl.message(
      'Auto translate comments',
      name: 'auto_translate_comments',
      desc: '',
      args: [],
    );
  }

  /// `Translation`
  String get translation_settings {
    return Intl.message(
      'Translation',
      name: 'translation_settings',
      desc: '',
      args: [],
    );
  }

  /// `Translation Display`
  String get translation_display_mode {
    return Intl.message(
      'Translation Display',
      name: 'translation_display_mode',
      desc: '',
      args: [],
    );
  }

  /// `Replace Original`
  String get replace_original {
    return Intl.message(
      'Replace Original',
      name: 'replace_original',
      desc: '',
      args: [],
    );
  }

  /// `Bilingual`
  String get bilingual_display {
    return Intl.message(
      'Bilingual',
      name: 'bilingual_display',
      desc: '',
      args: [],
    );
  }

  /// `Bilingual Style`
  String get bilingual_style {
    return Intl.message(
      'Bilingual Style',
      name: 'bilingual_style',
      desc: '',
      args: [],
    );
  }

  /// `Divider`
  String get bilingual_style_divider {
    return Intl.message(
      'Divider',
      name: 'bilingual_style_divider',
      desc: '',
      args: [],
    );
  }

  /// `Subtle Italic`
  String get bilingual_style_subtle {
    return Intl.message(
      'Subtle Italic',
      name: 'bilingual_style_subtle',
      desc: '',
      args: [],
    );
  }

  /// `Compact`
  String get bilingual_style_compact {
    return Intl.message(
      'Compact',
      name: 'bilingual_style_compact',
      desc: '',
      args: [],
    );
  }

  /// `Use Google Translate`
  String get use_google_translate {
    return Intl.message(
      'Use Google Translate',
      name: 'use_google_translate',
      desc: '',
      args: [],
    );
  }

  /// `Skip LLM and use free Google Translate directly`
  String get use_google_translate_tip {
    return Intl.message(
      'Skip LLM and use free Google Translate directly',
      name: 'use_google_translate_tip',
      desc: '',
      args: [],
    );
  }

  /// `Clear Translation Cache`
  String get clear_translation_cache {
    return Intl.message(
      'Clear Translation Cache',
      name: 'clear_translation_cache',
      desc: '',
      args: [],
    );
  }

  /// `Clear all cached translations?`
  String get clear_translation_cache_tip {
    return Intl.message(
      'Clear all cached translations?',
      name: 'clear_translation_cache_tip',
      desc: '',
      args: [],
    );
  }

  /// `{count} cached translations`
  String translation_cache_entries(Object count) {
    return Intl.message(
      '$count cached translations',
      name: 'translation_cache_entries',
      desc: '',
      args: [count],
    );
  }

  /// `Translation cache cleared`
  String get translation_cache_cleared {
    return Intl.message(
      'Translation cache cleared',
      name: 'translation_cache_cleared',
      desc: '',
      args: [],
    );
  }

  /// `Custom`
  String get custom_provider {
    return Intl.message('Custom', name: 'custom_provider', desc: '', args: []);
  }

  /// `Security Challenge`
  String get security_challenge {
    return Intl.message(
      'Security Challenge',
      name: 'security_challenge',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to logout?`
  String get logout_confirm {
    return Intl.message(
      'Are you sure to logout?',
      name: 'logout_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Blur cover image in list`
  String get cover_blur_tip {
    return Intl.message(
      'Blur cover image in list',
      name: 'cover_blur_tip',
      desc: '',
      args: [],
    );
  }

  /// `Load more fail`
  String get load_more_fail {
    return Intl.message(
      'Load more fail',
      name: 'load_more_fail',
      desc: '',
      args: [],
    );
  }

  /// `This is the original comment text.`
  String get bilingual_preview_original {
    return Intl.message(
      'This is the original comment text.',
      name: 'bilingual_preview_original',
      desc: '',
      args: [],
    );
  }

  /// `This is the translated comment text.`
  String get bilingual_preview_translated {
    return Intl.message(
      'This is the translated comment text.',
      name: 'bilingual_preview_translated',
      desc: '',
      args: [],
    );
  }

  /// `WebView permission requested`
  String get webview_permission_title {
    return Intl.message(
      'WebView permission requested',
      name: 'webview_permission_title',
      desc: '',
      args: [],
    );
  }

  /// `WebView has requested permission ''{kind}''`
  String webview_permission_content(Object kind) {
    return Intl.message(
      'WebView has requested permission \'\'$kind\'\'',
      name: 'webview_permission_content',
      desc: '',
      args: [kind],
    );
  }

  /// `Deny`
  String get deny {
    return Intl.message('Deny', name: 'deny', desc: '', args: []);
  }

  /// `Allow`
  String get allow {
    return Intl.message('Allow', name: 'allow', desc: '', args: []);
  }

  /// `Not Initialized`
  String get not_initialized {
    return Intl.message(
      'Not Initialized',
      name: 'not_initialized',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

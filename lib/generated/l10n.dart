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
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
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
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `English`
  String get language_name {
    return Intl.message(
      'English',
      name: 'language_name',
      desc: '',
      args: [],
    );
  }

  /// `Eros-N`
  String get app_title {
    return Intl.message(
      'Eros-N',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get newest {
    return Intl.message(
      'Newest',
      name: 'newest',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Thumbs`
  String get thumbs {
    return Intl.message(
      'Thumbs',
      name: 'thumbs',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Read',
      name: 'read',
      desc: '',
      args: [],
    );
  }

  /// `Resume`
  String get resume {
    return Intl.message(
      'Resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Never`
  String get never {
    return Intl.message(
      'Never',
      name: 'never',
      desc: '',
      args: [],
    );
  }

  /// `Always`
  String get always {
    return Intl.message(
      'Always',
      name: 'always',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get auto {
    return Intl.message(
      'Auto',
      name: 'auto',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Tags',
      name: 'tag_type_tags',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Groups',
      name: 'tag_type_groups',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
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

  /// `Popular All`
  String get popular_all {
    return Intl.message(
      'Popular All',
      name: 'popular_all',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Webtoon',
      name: 'webtoon',
      desc: '',
      args: [],
    );
  }

  /// `Vertical`
  String get vertical {
    return Intl.message(
      'Vertical',
      name: 'vertical',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Full Screen',
      name: 'full_screen',
      desc: '',
      args: [],
    );
  }

  /// `Display`
  String get display {
    return Intl.message(
      'Display',
      name: 'display',
      desc: '',
      args: [],
    );
  }

  /// `Theme Mode`
  String get theme_mode {
    return Intl.message(
      'Theme Mode',
      name: 'theme_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `List Style`
  String get list_style {
    return Intl.message(
      'List Style',
      name: 'list_style',
      desc: '',
      args: [],
    );
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

  /// `Tags Data`
  String get tags_data {
    return Intl.message(
      'Tags Data',
      name: 'tags_data',
      desc: '',
      args: [],
    );
  }

  /// `Show Tags`
  String get show_tags {
    return Intl.message(
      'Show Tags',
      name: 'show_tags',
      desc: '',
      args: [],
    );
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
    return Intl.message(
      'Wrap',
      name: 'wrap',
      desc: '',
      args: [],
    );
  }

  /// `Single Line`
  String get single_line {
    return Intl.message(
      'Single Line',
      name: 'single_line',
      desc: '',
      args: [],
    );
  }

  /// `Cover Blur`
  String get cover_blur {
    return Intl.message(
      'Cover Blur',
      name: 'cover_blur',
      desc: '',
      args: [],
    );
  }

  /// `List Model`
  String get list_model {
    return Intl.message(
      'List Model',
      name: 'list_model',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get list {
    return Intl.message(
      'List',
      name: 'list',
      desc: '',
      args: [],
    );
  }

  /// `Grid`
  String get grid {
    return Intl.message(
      'Grid',
      name: 'grid',
      desc: '',
      args: [],
    );
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

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Tag`
  String get tag {
    return Intl.message(
      'Tag',
      name: 'tag',
      desc: '',
      args: [],
    );
  }

  /// `Read Model`
  String get read_model {
    return Intl.message(
      'Read Model',
      name: 'read_model',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
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

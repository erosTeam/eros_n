import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/theme/theme.dart';
import 'package:eros_n/component/widget/desktop.dart';
import 'package:eros_n/component/widget/system_ui_overlay.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/webview_proxy/hidden_webview_proxy.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await windowManager.ensureInitialized();
  }

  // Enable WebView remote debugging on Android (chrome://inspect/#devices)
  if (kDebugMode && Platform.isAndroid) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  await Global.init();
  await LiquidGlassWidgets.initialize();

  initLogger();
  runApp(
    ProviderScope(
      observers: const [
        // LoggerObserver(),
      ],
      // Preserve v2 behaviour: do not auto-retry failing providers,
      // otherwise a single failed request keeps re-firing in the background.
      retry: (retryCount, error) => null,
      child: const MyApp(),
    ),
  );

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    const windowOptions = WindowOptions(
      title: 'Eros-N',
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state != AppLifecycleState.resumed) {}
    if (state == AppLifecycleState.resumed) {
      clipboardHelper.chkClipboardLink(context, ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.t('build MyApp');
    final themeMode = ref.watch(
      settingsProvider.select((settings) => settings.themeMode),
    );

    final localeCode = ref.watch(
      settingsProvider.select((settings) => settings.localeCode),
    );

    final themeColorLabel = ref.watch(
      settingsProvider.select((settings) => settings.themeColorLabel),
    );

    final dynamicColor = themeColorLabel == ThemeConfig.dynamicThemeColorLabel;
    final themeSeedColor =
        ThemeConfig.colorMap[themeColorLabel] ??
        ThemeConfig.colorMap[ThemeConfig.defaultThemeColorLabel]!;

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        final supportDynamicColors =
            lightDynamic != null && darkDynamic != null;

        logger.t('supportDynamicColors: $supportDynamicColors');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(settingsProvider.notifier)
              .setSupportDynamicColors(supportDynamicColors);
        });

        if (supportDynamicColors && dynamicColor) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(seedColor: themeSeedColor);
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: themeSeedColor,
            brightness: Brightness.dark,
          );
        }

        ThemeConfig.lightColorScheme = lightColorScheme;
        ThemeConfig.lightTheme = ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
          dividerTheme: const DividerThemeData(
            color: Colors.black12,
            thickness: 1,
            space: 0,
          ),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: lightColorScheme.surfaceContainerHighest,
          ),
        );

        ThemeConfig.darkColorScheme = darkColorScheme;
        ThemeConfig.darkTheme = ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: true,
          dividerTheme: const DividerThemeData(
            color: Colors.white24,
            thickness: 1,
            space: 0,
          ),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: darkColorScheme.surfaceContainerHighest,
          ),
        );

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: erosRouter.defaultRouteParser(),
          routeInformationProvider: erosRouter.routeInfoProvider(),
          routerDelegate: AutoRouterDelegate(
            erosRouter,
            navigatorObservers: () => [
              AppRouteObserver(),
              FlutterSmartDialog.observer,
            ],
          ),
          builder: SystemUIOverlay.init(
            builder: FlutterSmartDialog.init(
              styleBuilder: (child) {
                if (Platform.isWindows ||
                    Platform.isMacOS ||
                    Platform.isLinux) {
                  return Desktop(child: child);
                }
                return child;
              },
              builder: (context, child) =>
                  HiddenWebViewProxyHost(child: child ?? const SizedBox()),
            ),
          ),
          // builder: (BuildContext context, Widget? child) {
          //   final widget =
          //       BrokenShield(child: FlutterSmartDialog.init()(context, child));
          //   if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
          //     return Desktop(child: widget);
          //   }
          //   return widget;
          // },
          locale: locale(localeCode),
          onGenerateTitle: (BuildContext context) => L10n.of(context).app_title,
          // debugShowCheckedModeBanner: false,
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
          themeMode: themeMode,
          supportedLocales: [...L10n.delegate.supportedLocales],
          localizationsDelegates: const [
            L10n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}

base class LoggerObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final provider = context.provider;
    logger.d('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue",
  "newValue": "$newValue"
}''');
  }
}

Locale? locale(String localeCode) {
  if (localeCode.isEmpty) {
    return null;
  }
  final parts = localeCode.split('_');
  return Locale(parts[0], parts[1]);
}

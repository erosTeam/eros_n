import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/theme/theme.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'component/widget/broken_shield.dart';
import 'component/widget/desktop.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Global.init();

  initLogger();
  runApp(const ProviderScope(child: MyApp()));
  if(Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() {

      const initialSize = Size(600, 450);
      appWindow.minSize = initialSize;
      appWindow.size = Size(appWindow.size.width, appWindow.size.height + 1);
      appWindow.show();
    });
  }
}

bool _isDemoUsingDynamicColors = false;

const _brandBlue = Colors.blue;


class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dynamicColor =
    ref.watch(settingsProvider.select((settings) => settings.dynamicColor));
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        if (lightDynamic != null && darkDynamic != null && dynamicColor) {
          // On Android S+ devices, use the provided dynamic color scheme.
          // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
          lightColorScheme = lightDynamic.harmonized();

          // Repeat for the dark color scheme.
          darkColorScheme = darkDynamic.harmonized();

          _isDemoUsingDynamicColors = true; // ignore, only for demo purposes
        } else {
          // Otherwise, use fallback schemes.
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: _brandBlue,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: _brandBlue,
            brightness: Brightness.dark,
          );
        }

        ThemeConfig.lightColorScheme = lightColorScheme;
        ThemeConfig.lightTheme = ThemeData(
          colorScheme: lightColorScheme,
          // extensions: [lightCustomColors],
          useMaterial3: true,
        );

        ThemeConfig.darkColorScheme = darkColorScheme;
        ThemeConfig.darkTheme = ThemeData(
          colorScheme: darkColorScheme,
          // extensions: [darkCustomColors],
          useMaterial3: true,
        );

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: erosRouter.defaultRouteParser(),
          routeInformationProvider: erosRouter.routeInfoProvider(),
          routerDelegate: AutoRouterDelegate(
            erosRouter,
            navigatorObservers: () =>
            [
              AppRouteObserver(),
              FlutterSmartDialog.observer,
            ],
          ),
          builder: (BuildContext context, Widget? child) {
            final widget = BrokenShield(child: FlutterSmartDialog.init()(context, child));
            if(Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
              return Desktop(child: widget);
            }
            return widget;
          },
          onGenerateTitle: (BuildContext context) =>
          L10n
              .of(context)
              .app_title,
          // debugShowCheckedModeBanner: false,
          theme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
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

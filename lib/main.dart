import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/theme/theme.dart';
import 'package:eros_n/routes/routes.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:window_size/window_size.dart';

import 'component/widget/broken_shield.dart';
import 'component/widget/desktop.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Global.init();

  initLogger();
  runApp(const ProviderScope(
    observers: [
      // LoggerObserver(),
    ],
    child: MyApp(),
  ));
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() {
      setWindowVisibility(visible: true);
      setWindowTitle('Eros-N');
    });
  }
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.v('build MyApp');
    final themeMode =
        ref.watch(settingsProvider.select((settings) => settings.themeMode));

    final localeCode =
        ref.watch(settingsProvider.select((settings) => settings.localeCode));

    final themeColorLabel = ref
        .watch(settingsProvider.select((settings) => settings.themeColorLabel));

    final dynamicColor = themeColorLabel == ThemeConfig.dynamicThemeColorLabel;
    final themeSeedColor = ThemeConfig.colorMap[themeColorLabel] ??
        ThemeConfig.colorMap[ThemeConfig.defaultThemeColorLabel]!;

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        final supportDynamicColors =
            lightDynamic != null && darkDynamic != null;

        logger.d('supportDynamicColors: $supportDynamicColors');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(settingsProvider.notifier)
              .setSupportDynamicColors(supportDynamicColors);
        });

        if (supportDynamicColors && dynamicColor) {
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: themeSeedColor,
          );
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
            backgroundColor: lightColorScheme.surfaceVariant,
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
            backgroundColor: darkColorScheme.surfaceVariant,
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
          // builder: FlutterSmartDialog.init(
          //   styleBuilder: (child) {
          //     if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
          //       return Desktop(child: child);
          //     }
          //     return child;
          //   },
          //   builder: BrokenShield.init(),
          // ),
          builder: (BuildContext context, Widget? child) {
            final widget =
                BrokenShield(child: FlutterSmartDialog.init()(context, child));
            if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
              return Desktop(child: widget);
            }
            return widget;
          },
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

class LoggerObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
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

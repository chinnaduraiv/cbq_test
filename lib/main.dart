import 'package:cbq/dependency_injector/dependency_injector.dart';
import 'package:cbq/features/setting/language/appLocalizations.dart';
import 'package:cbq/routes/routes.dart';
import 'package:cbq/widgets/restart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const RestartApp(
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingState = ref.watch(settingNotifierProvider);
    final languageState = ref.watch(languageNotifierProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: settingState ? ThemeMode.dark : ThemeMode.light,
      routerConfig: routesApp.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: languageState ? const Locale('ar', '') : const Locale('en', ''),
    );
  }
}

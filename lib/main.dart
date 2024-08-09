import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_strategy/url_strategy.dart';

import '/layouts/main_layout.dart';
import '/models/common.dart';
import '/sections/sections_manager.dart';
import 'color_schemes.g.dart';
import 'constants.dart';


Future<void> main() async {
  final LocalizationDelegate delegate = await LocalizationDelegate.create(
    fallbackLocale: LangEnum.en_US.name,
    supportedLocales: <String>[LangEnum.en_US.name, LangEnum.fr_FR.name],
  );

  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    LocalizedApp(
      delegate,
      const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalizationDelegate localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        locale: localizationDelegate.currentLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        themeMode: ThemeMode.system,
        home: const SafeArea(
          child: MainLayout(child: SectionsManager()),
        ),
      ),
    );
  }
}

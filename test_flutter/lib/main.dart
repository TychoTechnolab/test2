import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // standaard taal

  void _changeLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en' ? const Locale('nl') : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meertalige App',
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MyHomePage(onChangeLanguage: _changeLanguage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final VoidCallback onChangeLanguage;
  const MyHomePage({super.key, required this.onChangeLanguage});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(local.hello),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(local.welcome),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onChangeLanguage,
              child: Text(local.changeLanguage),
            ),
          ],
        ),
      ),
    );
  }
}

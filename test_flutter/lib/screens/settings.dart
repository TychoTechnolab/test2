import 'package:flutter/material.dart';
import 'package:test_flutter/l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  final void Function(Locale locale) onSelectLanguage;

  const SettingsScreen({
    super.key,
    required this.onSelectLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(local.language),
          trailing: Text(local.localeName.toUpperCase()),
          onTap: () {
            _openLanguageSelector(context);
          },
        ),
      ],
    );
  }

  void _openLanguageSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ListView(
          children: AppLocalizations.supportedLocales.map((locale) {
            return ListTile(
              leading: const Icon(Icons.flag),
              title: Text(_localeName(locale)),
              onTap: () {
                onSelectLanguage(locale);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  String _localeName(Locale locale) {
    switch (locale.languageCode) {
      case 'en': return 'English';
      case 'nl': return 'Nederlands';
      default: return locale.languageCode;
    }
  }
}

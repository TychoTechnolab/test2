import 'package:flutter/material.dart';
import 'package:test_flutter/env.dart';
import 'package:test_flutter/l10n/app_localizations.dart';
import 'package:test_flutter/widgets/walk_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({
    super.key,
    required this.walks,
  });

  final List<String> walks;
  
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(local.noWalks),
          Text(Env.apiUrl),
        ],
      ),
    );
    
    if (walks.isNotEmpty) {
      content = ListView.builder(
        itemCount: walks.length,
        itemBuilder: (ctx, index) => WalkItem(title: walks[index])
      );
    }

    return content;
  }
}
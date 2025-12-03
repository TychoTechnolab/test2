import 'package:flutter/material.dart';
import 'package:test_flutter/env.dart';
import 'package:test_flutter/l10n/app_localizations.dart';

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
        itemBuilder: (ctx, index) => Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 1,
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // Small stroke above
                Container(
                  height: 8,
                  color: Colors.green,
                ),

                Stack(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.cover,
                      height: 220,
                      width: double.infinity,
                    ),

                    // Title of walk
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.green.withAlpha(191),
                        child: Text(
                          walks[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),

                // Stroke below with arrow
                Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return content;
  }
}
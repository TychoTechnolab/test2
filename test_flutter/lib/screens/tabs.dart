import 'package:flutter/material.dart';
import 'package:test_flutter/l10n/app_localizations.dart';
import 'package:test_flutter/screens/list.dart';
import 'package:test_flutter/screens/map.dart';
import 'package:test_flutter/screens/settings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
    required this.onSelectLanguage,
  });

  final void Function(Locale locale) onSelectLanguage;

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    Widget activePage = const ListScreen(
      walks: ["test", "hoi"],
    );

    if (_selectedPageIndex == 1) {
      activePage = const MapScreen();
    }
    else if (_selectedPageIndex == 2) {
      activePage = SettingsScreen(
        onSelectLanguage: widget.onSelectLanguage,
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            'assets/images/logo.png',
            height: 32,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 244),
        shape: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 69, 80, 108),
            width: 4,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 244),
      body: activePage,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color.fromARGB(255, 110, 164, 182),
          iconTheme: WidgetStateProperty.all(
            const IconThemeData(color: Colors.white),
          ),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(color: Colors.white),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Color.fromARGB(255, 69, 80, 108),
          onDestinationSelected: _selectPage,
          selectedIndex: _selectedPageIndex,
          destinations: [
            NavigationDestination(icon: Icon(Icons.list), label: local.navbarList),
            NavigationDestination(icon: Icon(Icons.map), label: local.navbarMap),
            NavigationDestination(icon: Icon(Icons.settings), label: local.navbarSettings),
          ],
        ),
      ),
    );
  }
}

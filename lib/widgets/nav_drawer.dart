import 'package:flutter/material.dart';
import 'package:helping_hands/classes/destination.dart';
import 'package:helping_hands/pages/bookmark.dart';
import 'package:helping_hands/pages/favorite.dart';
import 'package:helping_hands/pages/home.dart';

List<Destination> destinations = <Destination>[
  const Destination(
    'Favorite',
    Icon(Icons.favorite_outline),
    Icon(Icons.favorite),
  ),
  const Destination(
    'Bookmark',
    Icon(Icons.bookmark_outline),
    Icon(Icons.bookmark),
  ),
];

List<Widget> pages = <Widget>[
  const FavoritePage(),
  const BookmarkPage(),
];

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  int screenIndex = 0;

  ThemeMode themeMode = ThemeMode.light;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pages[screenIndex],
      ),
    );
  }

  void setThemeMode(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: handleScreenChanged,
      selectedIndex: screenIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            r"Hello Areykal  Have fun volunteering",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...destinations.map(
          (Destination destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          },
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 12, 16),
              child: Icon(Icons.dark_mode),
            ),
            const Text("Dark Mode"),
            Expanded(
              child: DarkThemeSwitch(
                setThememode: setThemeMode,
                themeMode: themeMode,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

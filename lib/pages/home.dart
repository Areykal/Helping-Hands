import 'package:flutter/material.dart';
import 'package:helping_hands/classes/database.dart';
import 'package:helping_hands/classes/destination.dart';
import 'package:helping_hands/pages/bookmark.dart';
import 'package:helping_hands/pages/favorite.dart';
import 'package:helping_hands/pages/post.dart';
import 'package:helping_hands/pages/profile.dart';

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

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key, required this.themeMode, required this.setThememode});

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> setThememode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      drawer: buildNavDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openNewPage(
            context,
            PostPage(
              add: true,
              index: 1,
              eventInfoEdit: EventInfoEdit(
                action: 'Save',
                event: EventInfo(),
              ),
            )),
        child: const Icon(Icons.add),
      ),
      body: const BuildHomeBody(
        sampleContentHeader: sampleContentHeader,
        sampleContentDetails: sampleContentDetails,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildSearchAnchor(),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () => _openNewPage(context, const ProfilePage()),
          icon: const CircleAvatar(
            foregroundImage: AssetImage("assets/images/profile.jpg"),
          ),
        ),
      ],
    );
  }

  static const sampleContentHeader = Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          foregroundImage: AssetImage("assets/images/profile.jpg"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Organization Name",
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                "Organiztion Type",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  static const sampleContentDetails = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
        image: AssetImage("assets/images/profile.jpg"),
      ),
      Text(
        "Event Title",
        style: TextStyle(fontSize: 24.0),
      ),
      Text(
        "Mangroves are extremely important to the coastal ecosystems they"
        " inhabit. Physically, they serve as a buffer between marine and"
        " terrestrial communities and protect shorelines from damaging winds"
        ", waves, and floods.",
        style: TextStyle(fontSize: 12.0),
      ),
    ],
  );

  NavigationDrawer buildNavDrawer(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: handleScreenChanged,
      selectedIndex: screenIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Hello Areykal \nHave fun volunteering!',
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
                setThememode: widget.setThememode,
                themeMode: widget.themeMode,
              ),
            ),
          ],
        ),
      ],
    );
  }

  SearchAnchor buildSearchAnchor() {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          hintText: "Search in Helping Hands",
          // backgroundColor:
          //     MaterialStatePropertyAll<Color>(Colors.lightBlue.shade50),
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () => controller.openView(),
          onChanged: (value) => controller.openView(),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (index) {
          final String item = "item $index";
          return ListTile(
            title: Text(item),
            onTap: () => setState(() {
              controller.closeView(item);
            }),
          );
        });
      },
    );
  }

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

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  void _openNewPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

class BuildHomeBody extends StatelessWidget {
  const BuildHomeBody({
    super.key,
    required this.sampleContentHeader,
    required this.sampleContentDetails,
  });

  final Padding sampleContentHeader;
  final Column sampleContentDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(),
              sampleContentHeader,
              sampleContentDetails,
              const Divider(),
              sampleContentHeader,
              sampleContentDetails,
              const Divider(),
              sampleContentHeader,
              sampleContentDetails,
            ]),
      ),
    );
  }
}

class DarkThemeSwitch extends StatefulWidget {
  const DarkThemeSwitch(
      {super.key, required this.themeMode, required this.setThememode});

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> setThememode;

  @override
  State<DarkThemeSwitch> createState() => _DarkThemeSwitchState();
}

class _DarkThemeSwitchState extends State<DarkThemeSwitch> {
  bool isOn = ThemeMode.system == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isOn,
      activeColor: Colors.green,
      onChanged: (value) => setState(() {
        isOn = value;
        widget.setThememode(isOn ? ThemeMode.dark : ThemeMode.light);
      }),
    );
  }
}

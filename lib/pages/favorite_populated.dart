import 'package:flutter/material.dart';

class FavoritePopulatedPage extends StatelessWidget {
  const FavoritePopulatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Alphabatical Order"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Recently Added"),
                ),
              ),
            ],
          ),
          ListTile(
            title: const Text(
              "Mangrove Planting",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("PSE"),
            trailing: const Icon(Icons.favorite),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Placeholder(),
              ),
            ),
          ),
          const Divider(height: 0),
          ListTile(
            title: const Text(
              "Search and Rescue",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("NYPD"),
            trailing: const Icon(Icons.favorite),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Placeholder(),
              ),
            ),
          ),
          const Divider(height: 0),
          ListTile(
            title: const Text(
              "Elder Care",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("Red Cross"),
            trailing: const Icon(Icons.favorite),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Placeholder(),
              ),
            ),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}

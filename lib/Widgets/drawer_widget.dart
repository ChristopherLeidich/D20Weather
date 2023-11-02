import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/second_page.dart';
import 'package:fantasy_weather_app/main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
                  // Handle settings or navigation
                Navigator.pop(context); // Close the drawer
                // Navigate to the second page
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings or navigation
              Navigator.pop(context); // Close the drawer
              // Navigate to the second page
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage(title: '',)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Handle about
            },
          ),
          const Divider(), // Divider between main and sub-drawer
          const SubDrawer(),
        ],
      ),
    );
  }
}

class SubDrawer extends StatelessWidget {
  const SubDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.star),
          title: const Text('Sub-Item 1'),
          onTap: () {
            // Handle sub-item 1
          },
        ),
        ListTile(
          leading: const Icon(Icons.star),
          title: const Text('Sub-Item 2'),
          onTap: () {
            // Handle sub-item 2
          },
        ),
      ],
    );
  }
}
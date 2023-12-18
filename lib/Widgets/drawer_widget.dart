import 'package:fantasy_weather_app/Widgets/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/second_page.dart';
import 'package:fantasy_weather_app/main.dart';

import 'create_custom_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF813181), // Set a background color for the header
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'You are currently not Logged in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(25),
                      backgroundColor: const Color(0x51DF17AA),
                    ),
                    icon: const Icon(Icons.lock_open),
                    label: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                  ),
                ],
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const SecondPage(title: ''),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box_outlined),
              title: const Text('Custom Page Builder'),
              onTap: () {
                // Handle about
                Navigator.pop(context);
                if (context.mounted) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Could not open Page. \n You need to be logged in to open this Page. \n Redirecting to Login Screen')));
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateCustomPage(title: '', description: '', pageName: '',)));
              },
            ),
            const Divider(), // Divider between main and sub-drawer
            const SubDrawer(),
          ],
        ),
      );

    } else {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user.displayName!),
              accountEmail: Text(user.email!),
              currentAccountPicture: const CircleAvatar(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings or navigation
                Navigator.pop(context); // Close the drawer
                // Navigate to the second page
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const SecondPage(title: '',)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box_outlined),
              title: const Text('Custom Page Builder'),
              onTap: () {
                // Handle about
                Navigator.pop(context);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CreateCustomPage(title: '', description: '', pageName: '',)));
              },
            ),
            const Divider(), // Divider between main and sub-drawer
            const SubDrawer(),
          ],
        ),
      );
    }
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
          const AboutListTile( // <-- SEE HERE
            icon: Icon(Icons.info,),
            applicationIcon: Icon( Icons.local_play,),
                applicationName: 'D20Weather',
                applicationVersion: '0.1.6',
                applicationLegalese: 'D20Weather © 2023 by Christopher Leidich and Francesco Quarta is licensed under CC BY-NC-SA 4.0',
          ///Content goes here...
            child: Text('About app'),
          ),
      ],
    );
  }
}
import 'package:fantasy_weather_app/Widgets/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/second_page.dart';
import 'package:fantasy_weather_app/main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          UserAccountsDrawerHeader(
            accountName: Text('user.uid'),
            accountEmail: Text('user.email!'),
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
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              // Handle about
              Navigator.pop(context);

              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
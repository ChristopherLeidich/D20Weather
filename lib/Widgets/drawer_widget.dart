import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy_weather_app/Widgets/PresetPages/custom_page.dart';
//import 'package:fantasy_weather_app/Widgets/PresetPages/custom_page.dart';
import 'package:fantasy_weather_app/Widgets/logins/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fantasy_weather_app/second_page.dart';
import 'package:fantasy_weather_app/main.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
//import 'package:palette_generator/palette_generator.dart';

import 'create_custom_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();

}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ///if user is not logged it return Drawer 1 else Return Drawer with User Data and more Features.
      return Drawer(
        backgroundColor: const Color(0xff6593a1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0x98ABD7CC),

                /// Set a background color for the header
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
                      backgroundColor:  const Color(0x98ABD7CC),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                /// Handle settings or navigation
                Navigator.pop(context);

                /// Close the drawer
                /// Navigate to the next page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              },
            ),
            AbsorbPointer(
              absorbing: false,
              child: ListTile(
                leading: const Icon(Icons.add_box_outlined),
                title: const Text('Custom Page Builder',
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Could not open Page. \n You need to be logged in to open this Page. \n Redirecting to Login Screen')));
                  }
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
            ),
            const Divider(),

            AboutListTile(
              icon: const Icon( Icons.local_play),
              applicationIcon: Image.asset('assets/icons/IconD20Cloud2.png', height: 53, width: 53,),
              applicationName: 'D20Weather',
              applicationVersion: '0.4.6',
              applicationLegalese:
              'D20Weather © 2023-2024 by Christopher Leidich and Francesco Quarta is licensed under CC BY-NC-SA 4.0',
              child: const Text('About app'),
            ),
            /// Divider between main and sub-drawer
          ],
        ),
      );
    } else {
      return Drawer(
          backgroundColor: Colors.blue,
          child: Scrollable(
          axisDirection: AxisDirection.down,
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                height: 230,
                child: GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: user.uid)).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("UID saved to clipboard")));
                    });
                  },
                  child: UserAccountsDrawerHeader(
                    accountName: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                              Text(user.displayName!, textAlign: TextAlign.start),
                              Text(user.uid, style: const TextStyle(fontSize: 10),)
                        ]
                      ) ,
                    ),
                    accountEmail: Text(user.email!),
                    currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person),
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xff3fb990),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.lightBlue,
                          Color(0xff1affff),
                        ], // Your gradient colors
                      ),
                      /// Set a background color for the header
                    ),
                  ),
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
                  leading: const Icon(Icons.add_box_outlined),
                  title: const Text('Custom Page Builder'),
                  onTap: () {
                    // Handle about
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const CreateCustomPage(
                              title: '',
                              description: '',
                              pageName: '',
                            )));
                  },
                ),
                const Divider(),

                AboutListTile(
                  icon: const Icon( Icons.local_play),
                  applicationIcon: Image.asset('assets/icons/IconD20Cloud2.png', height: 53, width: 53,),
                  applicationName: 'D20Weather',
                  applicationVersion: '0.4.6',
                  applicationLegalese:
                  'D20Weather © 2023-2024 by Christopher Leidich and Francesco Quarta is licensed under CC BY-NC-SA 4.0',
                  child: const Text('About app'),
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
                // stream: FirebaseFirestore.instance.collection('custom_page_data').snapshots(includeMetadataChanges: true),
                const Divider(),
                const Divider(),
                const Text(" Created Pages:", style: TextStyle(fontSize: 18,),),

                /// Divider between main and sub-drawer
                Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('custom_page_data').where("allowedUsers", arrayContains: user.uid)
                        .snapshots(includeMetadataChanges: true),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          'Something went wrong ${snapshot.error}',
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Column(
                            children: [
                              CircularProgressIndicator(),
                              Text("loading..."),
                            ]
                        );
                      }
                      return SizedBox(
                          height: double.maxFinite,
                          child: snapshot.hasData ? ListView(
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                              return ListTile(
                                title: Text(data['title']),
                                subtitle: Text(data['region_name']),
                                onTap: () {
                                  // Handle about
                                  Navigator.pop(context);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ItemDetails(
                                                itemID: document.id,
                                                imageMap: data,
                                              )));
                                  //FirebaseFirestore.instance.collection('custom_page_data').doc().
                                },
                              );
                            }).toList(),
                          ) : const Text("Leer"));
                    },
                  ),
                ),
                ),
              ],
            );
           }
        )
      );
    }
  }
}

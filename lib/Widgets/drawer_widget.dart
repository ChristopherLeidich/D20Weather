import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy_weather_app/Widgets/PresetPages/custom_page.dart';
import 'package:fantasy_weather_app/Widgets/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/second_page.dart';
import 'package:fantasy_weather_app/main.dart';
import 'package:palette_generator/palette_generator.dart';

import 'create_custom_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ///if user is not logged it return Drawer 1 else Return Drawer with User Data and more Features.
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF813181),

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
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings or navigation
                Navigator.pop(context); // Close the drawer
                // Navigate to the second page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(title: ''),
                    ));
              },
            ),
            AbsorbPointer(
              absorbing: false,
              child: ListTile(
                leading: const Icon(Icons.add_box_outlined),
                title: const Text('Custom Page Builder'),
                onTap: () {
                  Navigator.pop(context);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Could not open Page. \n You need to be logged in to open this Page. \n Redirecting to Login Screen')));
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateCustomPage(
                                title: '',
                                description: '',
                                pageName: '',
                              )));
                },
              ),
            ),
            const Divider(),

            /// Divider between main and sub-drawer
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPage(
                              title: '',
                            )));
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
                        builder: (context) => const CreateCustomPage(
                              title: '',
                              description: '',
                              pageName: '',
                            )));
              },
            ),
            const Divider(),

            /// Divider between main and sub-drawer
            const SubDrawer(),
          ],
        ),
      );
    }
  }
}

class SubDrawer extends StatefulWidget {
  const SubDrawer({super.key});

  @override
  State<SubDrawer> createState() => _SubDrawerState();
}

class _SubDrawerState extends State<SubDrawer> {
  final Stream<QuerySnapshot> _pageStream = FirebaseFirestore.instance.collection('custom_page_data').snapshots();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    StreamBuilder<QuerySnapshot>(
    stream: _pageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['title']),
              subtitle: Text(data['region_name']),
            );
          }).toList(),
        );
      },
      ),
        const AboutListTile(
          icon: Icon(
            Icons.info,
          ),
          applicationIcon: Icon(
            Icons.local_play,
          ),
          applicationName: 'D20Weather',
          applicationVersion: '0.2.0',
          applicationLegalese:
              'D20Weather © 2023 by Christopher Leidich and Francesco Quarta is licensed under CC BY-NC-SA 4.0',
          child: Text('About app'),
        ),
      ],
    );
  }
}

/*final RegExp dicePattern = RegExp(r'(\d+)d(\d+)');
* Match singleMatch = dicePattern.match(value);
* string diceResult;
*  roller.roll())
*final TextEditingController _dicecontroller = TextEditingController();
* Column( children: [
* TextFormField(
                controller: _dicecontroller,
                maxLength: 6,
                keyboardType: TextInputType.string,
                decoration: const InputDecoration(
                    labelText: 'Dice Roller',
                    hintText: 'Enter a valid Dice. Example: 1d20\n
                    Number in front = Number of Dices\n
                    Number behind = Number of Faces'
                ),
                validator: (String? value){

                  if(value==null || value.isEmpty)
                  {
                    return 'Please enter a correct dice expression.';
                  }

                  if(singleMatch == null)
                  {
                    return 'Input must match a regular dice expression. Example: 1d20';
                  }
                  else string diceResult = roller.roll(value);


                  return null;
                },
                ),
     IconButton(
          icon: const Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {

            });
          },
        ),

     ]
     )
 */

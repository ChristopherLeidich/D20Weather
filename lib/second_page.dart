import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title});

  final String title;

  @override
  State<SecondPage> createState() => _MyAppState();
}

class _MyAppState extends State<SecondPage> {
  bool isSwitched = false; //Default Status of the Light Dark Mode Switch

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: isSwitched
            ? ThemeClass.darkTheme
            : ThemeClass
                .lightTheme, //initializes the Switch with lightTheme created in the themes folder
        home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 36,
            title: const Text(
                'Settings'), //actions: [   // gives the Switch its functionality
            // ],
          ),
          drawer: const MyDrawer(),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Enable Dark Mode?',
                  style: TextStyle(fontSize: 28),
                ),
                Switch(
                    activeColor: Colors.greenAccent,
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = !isSwitched;
                      });
                    }),
              ],
            ),
          ),
        ),
      );
}

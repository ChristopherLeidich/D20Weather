import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
import 'package:animated_button_bar/animated_button_bar.dart';

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
          body: Column(children: [
            Row(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //inverted selection button bar
                AnimatedButtonBar(
                  radius: 8.0,
                  padding: const EdgeInsets.all(16.0),
                  invertedSelection: true,
                  children: [
                    ButtonBarEntry(onTap: () => (), child: const Text('Day')),
                    ButtonBarEntry(onTap: () => (), child: const Text('Week')),
                    ButtonBarEntry(onTap: () => (), child: const Text('Month')),
                    ButtonBarEntry(onTap: () => (), child: const Text('Year'))
                  ],
                ),
                //You can populate it with different types of widgets like Icon
                AnimatedButtonBar(
                  radius: 32.0,
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.blueGrey[800],
                  foregroundColor: Colors.blueGrey[300],
                  elevation: 24,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  innerVerticalPadding: 16,
                  children: [
                    ButtonBarEntry(
                        onTap: () => (), child: const Icon(Icons.person)),
                    ButtonBarEntry(
                        onTap: () => (), child: const Icon(Icons.people)),
                  ],
                ),
              ],
            ),
          ]),
        ),
      );
}

//import 'dart:async';

//import 'package:adaptive_theme/adaptive_theme.dart';
//import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:flutter/material.dart';

import 'Widgets/themes.dart';
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:qr_flutter/qr_flutter.dart';

import 'dart:math';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //get isDarkTheme => _MyCustomAppBarState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: /*isDarkTheme ? ThemeClass.darkTheme :*/ ThemeClass.darkTheme,
      home: const MyCustomAppBar(),
    );
  }
}

class MyCustomAppBar extends StatefulWidget {
  const MyCustomAppBar({super.key});

  @override
  State<MyCustomAppBar> createState() => _MyCustomAppBarState();
}

class _MyCustomAppBarState extends State<MyCustomAppBar> {
  bool isDarkTheme = false; // Added a boolean to track the theme

  double _doubleValue = 0.0;    //used for generating a random double Value
  String _printableValue = '0.0'; //this is the temperature that gets printed in the End
  String _preSymbol = '+';      //Symbol for negative/Positive Temperatures

  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  void _incrementCounter() {
    setState(() {
      //external factory Random([int? seed]);
      var boolValue = Random().nextBool();    //randomizes the Symbol initialized in line 31
      if(boolValue == true){
        _preSymbol ='+';
      }else{
        _preSymbol ='-';
      }
      _doubleValue = Random().nextDouble() * 36;     // generates a random double-Value between 0.0 and 36.0
      _printableValue = _doubleValue.toStringAsFixed(1);  //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The App'),
        actions: [
          const MyMenuButton(),
          MyStatefulWidgetWidget(
            toggleTheme: toggleTheme,
            isDarkTheme: isDarkTheme,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'The Current Temperature is '
            ),
            Text(
              _preSymbol + _printableValue,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
                '° C'
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}

class MyMenuButton extends StatelessWidget {
  const MyMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 1,
            child: Text('Option 1'),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text('Option 2'),
          ),
          const PopupMenuItem(
            value: 3,
            child: Text('Option 3'),
          ),
        ];
      },
    );
  }
}

class MyStatefulWidgetWidget extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkTheme;

  const MyStatefulWidgetWidget({super.key, required this.toggleTheme, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: isDarkTheme ? const Icon(Icons.brightness_4) : const Icon(Icons.brightness_7),
          onPressed: toggleTheme, // Toggle theme when pressed
        ),
       /* Icon(
          //isDarkTheme ? Icons.brightness_4 : Icons.brightness_7,
          color: isDarkTheme ? ThemeClass().darkPrimaryColor : ThemeClass().lightPrimaryColor,
        ),*/
      ],
    );
  }
}

/*
void main() {
  runApp(const MyApp(title: '',));
}
class MyApp extends StatefulWidget {
  const MyApp({ super.key, required this.title });

  final String title;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;    //Default Status of the Light Dark Mode Switch

  int _counter = 0;
  double _doubleValue = 0.0;    //used for generating a random double Value
  String _printableValue = '0.0'; //this is the temperature that gets printed in the End
  String _preSymbol = '+';      //Symbol for negative/Positive Temperatures


  void _incrementCounter() {
    setState(() {
      _counter++;
      //external factory Random([int? seed]);
      var boolValue = Random().nextBool();    //randomizes the Symbol initialized in line 31
      if(boolValue == true){
        _preSymbol ='+';
      }else{
        _preSymbol ='-';
      }
      _doubleValue = Random().nextDouble() * 36;     // generates a random double-Value between 0.0 and 36.0
      _printableValue = _doubleValue.toStringAsFixed(1);  //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: isSwitched ? ThemeClass.darkTheme : ThemeClass.lightTheme,   //initializes the Switch with lightTheme created in the themes folder
        home:  Scaffold(
          appBar: AppBar(title: const Text('The Ultimate Switch'), actions: [   // gives the Switch its functionality
           Switch(
             activeColor: Colors.greenAccent,
             value: isSwitched,
             onChanged: (value){
                setState((){
                  isSwitched = !isSwitched;
                });
             })
          ],

            // elevation: 0,
            // titleSpacing: 0,
            // leading: isLargeScreen
            //     ? null
            //     : IconButton(
            //   icon: const Icon(Icons.menu),
            //   onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            // ),

          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
                'The Current Temperature is '
            ),
            Text(
              _preSymbol + _printableValue,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text(
                '° C'
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    ),
  );
}

class ResponsiveNavBarPage extends StatelessWidget {
  ResponsiveNavBarPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            elevation: 0,
            titleSpacing: 0,
            leading: isLargeScreen
                ? null
                : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Logo",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  if (isLargeScreen) Expanded(child: _navBarItems())
                ],
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(child: _ProfileIcon()),
              )
            ],
          ),
          drawer: isLargeScreen ? null : _drawer(),
          body: const Center(
            child: Text(
              "Body",
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawer() => Drawer(
    child: ListView(
      children: _menuItems
          .map((item) => ListTile(
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
        title: Text(item),
      ))
          .toList(),
    ),
  );

  Widget _navBarItems() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: _menuItems
        .map(
          (item) => InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 24.0, horizontal: 16),
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    )
        .toList(),
  );
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];

enum Menu { itemOne, itemTwo, itemThree }

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        icon: const Icon(Icons.person),
        offset: const Offset(0, 40),
        onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
          const PopupMenuItem<Menu>(
            value: Menu.itemOne,
            child: Text('Account'),
          ),
          const PopupMenuItem<Menu>(
            value: Menu.itemTwo,
            child: Text('Settings'),
          ),
          const PopupMenuItem<Menu>(
            value: Menu.itemThree,
            child: Text('Sign Out'),
          ),
        ]);
  }
}



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   double _doubleValue = 0.0;
//   String _printableValue = '0.0';
//   String _preSymbol = '+';
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//       //external factory Random([int? seed]);
//       var boolValue = Random().nextBool();
//       if(boolValue == true){
//         _preSymbol ='+';
//       }else{
//         _preSymbol ='-';
//       }
//       _doubleValue = Random().nextDouble() * 6;
//       _printableValue = _doubleValue.toStringAsFixed(1);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const Text(
//               'The Current Temperature is '
//             ),
//             Text(
//               _preSymbol + _printableValue,
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const Text(
//               '° C'
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
*/

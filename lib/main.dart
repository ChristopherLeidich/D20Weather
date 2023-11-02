import 'dart:async';
import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/Widgets/caruosel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
import 'dart:math';
//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:qr_flutter/qr_flutter.dart';

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
      theme: ThemeClass.lightTheme,
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

  final CarouselController _carouselController = CarouselController();
  int currentIndex = 0;

  int wind = 0;
  double doubleValues = 0.0;    //used for generating a random double Value
  String printableValues = '0.0'; //this is the temperature that gets printed in the End
  String preSymbol = '+';      //Symbol for negative/Positive Temperatures

  late Timer _timer;   //initializes The Timer

  @override
  void initState() {
    super.initState();
    randomizer(); // Generate the first random value when the app is started

    _timer = Timer.periodic(const Duration(seconds: 4, milliseconds: 42), (timer) {   //Generates a new Random Value in the void randomizer() after a set amount of seconds
      randomizer();
    });
  }

  void randomizer() {
    setState(() {
      //external factory Random([int? seed]);
      var boolValue = Random().nextBool();    //randomizes the Symbol initialized in line 31
      if(boolValue == true){
        preSymbol ='+';
      }else{
        preSymbol ='-';
      }

      wind = Random().nextInt(180);
      //final doubleValues = List.generate(3, (index) => Random().nextDouble() * 36);
      doubleValues = Random().nextDouble() * 41;     // generates a random double-Value between 0.0 and 36.0
      printableValues = doubleValues.toStringAsFixed(1);  //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        title: const Center(child: Text('Primematerial Weather App')), // Replace PopupMenuButton with a drawer
      ),
      drawer: const MyDrawer(),
      body: Column(
            children: [
              CarouselSliderWidget(controller: _carouselController, onIndexChanged: (index) {// Use the CarouselSliderWidget in the body
                setState(() {
                  currentIndex = index;
                });
            }, printableValue: printableValues, preSymbol: preSymbol),
            TextWidget(currentIndex: currentIndex, wind: wind),
          ],
        ),
      );
  }
}


class TextWidget extends StatelessWidget {
  final int currentIndex;

  final int wind;

  const TextWidget({super.key, required this.currentIndex, required this.wind});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black), // Add a black border
      ),
      child: Column(      //switch case später einfügen
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Mwangi expanse: ',
              style: TextStyle(
                //color: Colors.white,
                fontWeight: FontWeight.bold,
              )
          ),
          const Text(
            'The Mwangi Expanse (pronounced MWAN-gi),archaically also called the Forbidden Jungle,is the catch-all term given to the wild interior of central and western Garund. The Expanse also extends southwards beyond the Inner Sea region,\n\n',
            //style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Text('Wetterbedingungen: ',
              style: TextStyle(
                //color: Colors.white,
                fontWeight: FontWeight.bold,
              )
          ),
          const Text('8th Umbral Calamity\n'),
          const Text('Wind: ',
              style: TextStyle(
                //color: Colors.white,
                fontWeight: FontWeight.bold,
              )
          ),
          const Text('Windrichtung: Westen'),
          Text('Windgeschwindigkeit: $wind km/h'),
        ], /*TextField(
        decoration: InputDecoration(
          labelText: 'Hello There $currentIndex',
          border: const OutlineInputBorder(),
        ),
      ),*/
      ),
    );
  }
}

/*
void main() {
  runApp(const MyApp(title: '',));
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
}*/

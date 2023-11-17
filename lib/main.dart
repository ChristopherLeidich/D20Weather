import 'dart:async';
import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fantasy_weather_app/Widgets/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
//import 'package:fantasy_weather_app/Widgets/starviewfield.dart';
import 'dart:math';

//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:qr_flutter/qr_flutter.dart';

// import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_cloud_bg.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_color_bg.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_night_star_bg.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_rain_snow_bg.dart';
// import 'package:flutter_weather_bg_null_safety/bg/weather_thunder_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
// import 'package:flutter_weather_bg_null_safety/utils/image_utils.dart';
// import 'package:flutter_weather_bg_null_safety/utils/print_utils.dart';
// import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
// import 'package:parallax_rain/parallax_rain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      home: const MyCustomAppBar(),
    );
  }
}

class Regional {
  final String regionalName;
  final String regionalDescription;
  final String effectRegionalName;
  final String effectRegionaldescription;
  final String effectRegional;
  final int regionalTemperatureLimit;
  final bool negativeTemperature;

  Regional({  required this.regionalName,
              required this.regionalDescription,
              required this.effectRegionalName,
              required this.effectRegionaldescription,
              required this.effectRegional,
              required this.regionalTemperatureLimit,
              required this.negativeTemperature
  });
}

class Weather{
  final String weatherName;
  final String weatherDescription;
  final String weatherEffectname;
  final String weatherEffectdescription;
  final String weatherEffect;
  
  Weather({ required this.weatherName,
            required this.weatherDescription,
            required this.weatherEffectname,
            required this.weatherEffectdescription,
            required this.weatherEffect
  });
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

  final List<Regional> regionList = [
    Regional( regionalName:   'Jungle',
        regionalDescription:  'A jungle is land covered with dense forest and tangled vegetation, usually in tropical climates. '
                              'Application of the term has varied greatly during the past recent century.',
              effectRegionalName:         'Insect Plague',
              effectRegionaldescription:  'Non Undead Creatures are constantly swarmed by Tiny mosquitoes and other Insects',
              effectRegional: 'Once every 1d6[[1d6]] Hours every Non-Undead Member of the Party has to roll a basic DC15 Fortitude-Save or'
                              ' loose 1d2[[1d2]] HP'
                              'On a critical Failure the Damage Dice Changes to 1d4[[1d4]]'
                              ' and the Party-Member will be contaminated by a random Decease',
              regionalTemperatureLimit: 48,
              negativeTemperature: false
    ),
    Regional( regionalName: 'Glacier',
              regionalDescription: 'Cold Snow Ice What do you want',
              effectRegionalName: 'Death',
              effectRegionaldescription: 'Kills you',
              effectRegional: 'You die(no you do not have cold resistance)',
              regionalTemperatureLimit: 36,
              negativeTemperature: true,
    ),
    Regional( regionalName: '6-th World',
              regionalDescription: 'Description for Item 3',
              effectRegionalName: '',
              effectRegionaldescription: '',
              effectRegional: '',
              regionalTemperatureLimit: 74,
              negativeTemperature: false
    ),
  ];
  final List<Weather> weatherList =[
    Weather(  weatherName: 'Light Rain',
              weatherDescription: '',
              weatherEffectname: 'weatherEffectname',
              weatherEffectdescription: 'weatherEffectdescription',
              weatherEffect: 'weatherEffect'
    ),
    Weather(  weatherName: 'Sun',
              weatherDescription: '',
              weatherEffectname: 'weatherEffectname',
              weatherEffectdescription: 'weatherEffectdescription',
              weatherEffect: 'weatherEffect'
    )
  ];
  var dirlist = ['North','North-West','West','North-East','East','South','South-West','South-East'];
  String direction ='';
  var wetterbedingunsliste = ['Umbral-Storm','Radiant-Storm','Thunderstorm','Phantasmal-Rain','Rain','Sun','Drought', 'Storm','Snow','Hail','Drizzle','Cloudy'];
  String wetterBedingung ='';

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
      final random1 = Random();
      final random2 = Random();
      direction = dirlist[random1.nextInt(dirlist.length)];
      wetterBedingung = wetterbedingunsliste[random2.nextInt(wetterbedingunsliste.length)];

      wind = Random().nextInt(64);
      //final doubleValues = dirlist.generate(3, (index) => Random().nextDouble() * 36);
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.lightBlue, Colors.blue], // Your gradient colors
            ),
          ),
        ),

        title: const Align(
            alignment: Alignment.centerRight,
            child: Text('D20Weather')), // Replace PopupMenuButton with a drawer
      ),
      drawer: const MyDrawer(),
      body: Stack(
            children: [
              WeatherBg(
                  weatherType: WeatherType.heavySnow,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
              ),
              //const StarsViewBackground(),
              Column(
                children: [
              CarouselSliderWidget(controller: _carouselController, onIndexChanged: (index) {// Use the CarouselSliderWidget in the body
                setState(() {
                  currentIndex = index;
                });
              }, printableValue: printableValues, preSymbol: preSymbol),
              TextWidget(currentIndex: currentIndex, wind: wind, direction: direction, wetterBedingung: wetterBedingung),
                ],
              ),
          ],
        ),
      );
  }
}


class TextWidget extends StatelessWidget {
  final int currentIndex;

  final int wind;
  final String direction;
  final String wetterBedingung;

  const TextWidget({super.key, required this.currentIndex, required this.wind, required this.direction, required this.wetterBedingung});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            border: Border.all(width: 0.1, color: Colors.black54),
            borderRadius: const BorderRadius.all(
                Radius.circular(20)// Add a black border
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        child: Scrollable(
          axisDirection: AxisDirection.down,
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return Column(
              //switch case später einfügen
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Mwangi expanse: ',
                    style: TextStyle(
                      height: 1.6,
                      backgroundColor: Colors.white,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    'The Mwangi Expanse (pronounced MWAN-gi),archaically also called the Forbidden Jungle, '
                        'is the catch-all term given to the wild interior of central and western Garund. '
                        'The Expanse also extends southwards beyond the Inner Sea region.',
                    style: TextStyle(
                      height: 2.0,
                      backgroundColor: Colors.white,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Wetterbedingungen: ',
                          style: TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.white,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(wetterBedingung,
                          style: const TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.white,
                            color: Colors.blueGrey,
                          )),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Wind: ',
                      style: TextStyle(
                        height: 2.0,
                        backgroundColor: Colors.white,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Windrichtung: $direction',
                      style: const TextStyle(
                        height: 2.0,
                        backgroundColor: Colors.white,
                        color: Colors.blueGrey,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Windgeschwindigkeit: $wind km/h',
                      style: const TextStyle(
                        height: 2.0,
                        backgroundColor: Colors.white,
                        color: Colors.blueGrey,
                      )
                  ),
                ),
              ],
            );
          },
        )
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
    child: dirlistView(
      children: _menuItems
          .map((item) => dirlistTile(
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
        title: Text(item),
      ))
          .todirlist(),
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
        .todirlist(),
  );
}

final dirlist<String> _menuItems = <String>[
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

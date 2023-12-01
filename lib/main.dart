//import 'dart:io';

import 'dart:async';
import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fantasy_weather_app/Widgets/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
import 'package:fantasy_weather_app/Widgets/starviewfield.dart';
import 'dart:math';
//import 'package:flutter/services.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:qr_flutter/qr_flutter.dart';

import 'package:d20/d20.dart';

//import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';

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
import 'package:parallax_rain/parallax_rain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme,
      home: const MyCustomAppBar(),
    );
  }
}

class Regional {
  final String regionalName;
  final String regionalDescription;
  final String effectRegionalName;
  final String effectRegionaldescription;
  final String effectRegional1;
  final String roller1;
  final String effectRegional2;
  final String roller2;
  final String effectRegional3;
  final String roller3;
  final String effectRegional4;
  final String roller4;
  final String effectRegional5;
  final int regionalTemperatureLimitPositive;
  final int regionalTemperatureLimitNegative;
  final bool negativeTemperature;

  Regional(
      {
      required this.regionalName,
      required this.regionalDescription,
      required this.effectRegionalName,
      required this.effectRegionaldescription,
      required this.effectRegional1,
      required this.roller1,
      required this.effectRegional2,
      required this.roller2,
      required this.effectRegional3,
      required this.roller3,
      required this.effectRegional4,
      required this.roller4,
      required this.effectRegional5,
      required this.regionalTemperatureLimitPositive,
      required this.regionalTemperatureLimitNegative,
      required this.negativeTemperature});
}

class Weather {
  final String weatherName;
  final String weatherDescription;
  final String weatherEffectname;
  final String weatherEffectdescription;
  final String weatherEffect;

  Weather(
      {required this.weatherName,
      required this.weatherDescription,
      required this.weatherEffectname,
      required this.weatherEffectdescription,
      required this.weatherEffect});
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
  double doubleValues = 0.0; //used for generating a random double Value
  String printableValues =
      '0.0'; //this is the temperature that gets printed in the End
  String preSymbol = '+'; //Symbol for negative/Positive Temperatures

  //dice section
  int d2 = 1;
  final roller = D20();

  final List<Regional> regionList = [
    Regional(
        regionalName: 'Jungle',
        regionalDescription:
            'A jungle is land covered with dense forest and tangled vegetation, usually in tropical climates. '
            'It is hard for unprepared Partys to traverse the Area without issue.',
        effectRegionalName: 'Insect Plague',
        effectRegionaldescription:
            'Non Undead Creatures are constantly swarmed by \nTiny mosquitoes and other Insects',
        effectRegional1: 'Once every 1d6 [',
        roller1: '1d6',
        effectRegional2: '] Hours every Non-Undead Member of the Party has to roll \na basic DC15 Fortitude-Save or loose 1d2 ',
        roller2: '1d2',
        effectRegional3: ' HP.\nOn a critical Failure the Damage Dice Changes to 1d4 ',
        roller3: '1d4',
        effectRegional4: ' and the Party-Member will be contaminated by a random Decease',
        roller4: '1d0',
        effectRegional5: '.',
        regionalTemperatureLimitPositive: 48,
        regionalTemperatureLimitNegative: 0,
        negativeTemperature: false),
    Regional(
      regionalName: 'Glacier',
      regionalDescription:  'A Cold barren Wasteland of Ice and Snow. '
                            'The Cold Temperatures do little in the way of hospitability. \n'
                            'To an unprepared Party Traversing these Icy Planes means almost certain Death.',
      effectRegionalName: 'Deadly Frost',
      effectRegionaldescription:  'The Cold is Clinging onto your Body, '
                                  'leaving you more Susceptible to harm from all Sources.',
      effectRegional1: 'For the Duration of your Stay every Member of the Party that does not have at least Cold-Resistance 5 has to roll a basic DC 18 Fortitude Save every 1d4 [',
      roller1: '1d4',
      effectRegional2: '] Hours or gain one Level of Enfeeblement and Take 1d6 [',
      roller2: '1d6',
      effectRegional3: '] Cold damage\n This Debuff lasts until the Character takes a Long-Rest in a warm-Location or until death.\n On a critical Failure they additionally gain a Stack of the Wounded Condition and the Damage-Dice Changes to 1d8 [',
      roller3: '1d8',
      effectRegional4: 'of Cold Damage.\n Party-Members with at least Cold-Resistance 5 do these Fortitude Saves instead every 1d8 [',
      roller4: '1d8',
      effectRegional5: '] Hours with the Same Effects on a Failure and Critical Failure.',
      regionalTemperatureLimitPositive: 6,
      regionalTemperatureLimitNegative: 48,
      negativeTemperature: true,
    ),
    Regional(
        regionalName: 'Ocean',
        regionalDescription: 'Description for Item 3',
        effectRegionalName: ' ',
        effectRegionaldescription: ' ',
        effectRegional1: ' ',
        roller1: '1d0',
        effectRegional2: ' ',
        roller2: '1d0',
        effectRegional3: ' ',
        roller3: '1d0',
        effectRegional4: ' ',
        roller4: '1d0',
        effectRegional5: ' ',
        regionalTemperatureLimitPositive: 74,
        regionalTemperatureLimitNegative: 4,
        negativeTemperature: true
    ),
    Regional(
        regionalName: 'Beach',
        regionalDescription: 'Description for Item 3',
        effectRegionalName: ' ',
        effectRegionaldescription: ' ',
        effectRegional1: ' ',
        roller1: '1d0',
        effectRegional2: ' ',
        roller2: '1d0',
        effectRegional3: ' ',
        roller3: '1d0',
        effectRegional4: ' ',
        roller4: '1d0',
        effectRegional5: ' ',
        regionalTemperatureLimitPositive: 74,
        regionalTemperatureLimitNegative: 0,
        negativeTemperature: false
    ),
    Regional(
        regionalName: 'Forest',
        regionalDescription: 'Description for Item 3',
        effectRegionalName: ' ',
        effectRegionaldescription: ' ',
        effectRegional1: ' ',
        roller1: '1d0',
        effectRegional2: ' ',
        roller2: '1d0',
        effectRegional3: ' ',
        roller3: '1d0',
        effectRegional4: ' ',
        roller4: '1d0',
        effectRegional5: ' ',
        regionalTemperatureLimitPositive: 22,
        regionalTemperatureLimitNegative: 24,
        negativeTemperature: true
    ),
    Regional(
        regionalName: 'Desert',
        regionalDescription: 'Description for Item 3',
        effectRegionalName: ' ',
        effectRegionaldescription: ' ',
        effectRegional1: ' ',
        roller1: '1d0',
        effectRegional2: ' ',
        roller2: '1d0',
        effectRegional3: ' ',
        roller3: '1d0',
        effectRegional4: ' ',
        roller4: '1d0',
        effectRegional5: ' ',
        regionalTemperatureLimitPositive: 54,
        regionalTemperatureLimitNegative: 10,
        negativeTemperature: true
    ),
  ];

  final List<Weather> weatherList = [
    Weather(
        weatherName: 'Drizzle',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Drought',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Storm',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Thunderstorm',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Snow',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Hail',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Cloudy',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Radiant-Storm',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Umbral-Storm',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
    Weather(
        weatherName: 'Phantasmal-Rain',
        weatherDescription: '',
        weatherEffectname: 'weatherEffectname',
        weatherEffectdescription: 'weatherEffectdescription',
        weatherEffect: 'weatherEffect'
    ),
  ];

  var dirlist = [
    'North',
    'North-West',
    'West',
    'North-East',
    'East',
    'South',
    'South-West',
    'South-East'
  ];

  String direction = '';

  var wetterbedingunsliste = [
    'Umbral-Storm',
    'Radiant-Storm',
    'Thunderstorm',
    'Phantasmal-Rain',
    'Rain',
    'Sun',
    'Drought',
    'Storm',
    'Snow',
    'Hail',
    'Drizzle',
    'Cloudy'
  ];
  String wetterBedingung = '';

  int randIndex = 0;


  late Timer _timer; //initializes The Timer

  @override
  void initState() {
    super.initState();
    randomizer(); // Generate the first random value when the app is started

    _timer =
        Timer.periodic(const Duration(seconds: 4, milliseconds: 42), (timer) {
      //Generates a new Random Value in the void randomizer() after a set amount of seconds
      randomizer();
    });
  }

  void randomizer() {
    setState(() {
      //external factory Random([int? seed]);
      var boolValue = Random().nextBool(); //randomizes the Symbol initialized in line 31
      if (boolValue == true) {
        preSymbol = '+';
      } else {
        preSymbol = '-';
      }
      final random1 = Random();
      final random2 = Random();
      direction = dirlist[random1.nextInt(dirlist.length)];
      wetterBedingung = wetterbedingunsliste[random2.nextInt(wetterbedingunsliste.length)];

      randIndex = random1.nextInt(regionList.length);

      wind = Random().nextInt(64);
      //final doubleValues = dirlist.generate(3, (index) => Random().nextDouble() * 36);
      doubleValues = Random().nextDouble() *
          41; // generates a random double-Value between 0.0 and 36.0
      printableValues = doubleValues.toStringAsFixed(
          1); //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  //get isDarkTheme => _MyCustomAppBarState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.lightBlue,
                Colors.blue
              ], // Your gradient colors
            ),
          ),
        ),

        title: const Align(
            alignment: Alignment.centerRight,
            child: Text('D20Weather')),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_book, color: Colors.black,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

    // Replace PopupMenuButton with a drawer
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          switch (wetterBedingung) {
            "Umbral-Storm" => ParallaxRain(
                dropColors: const [
                  Colors.deepPurpleAccent,
                  Colors.blueGrey,
                  Colors.blue,
                  Colors.blueAccent,
                  Colors.brown,
                  Colors.blueGrey
                ],
                trail: true,
              ),
            "Radiant-Storm" => ParallaxRain(
                dropColors: const [
                  Colors.yellow,
                  Colors.yellowAccent,
                  Colors.white70,
                  Colors.lightBlue,
                  Color(0xFFc9c165),
                  Color(0xFFcc9654)
                ],
                trail: true,
              ),
            "Thunderstorm" => WeatherBg(
                weatherType: WeatherType.thunder,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Phantasmal-Rain" => const StarsViewBackground(),
            "Rain" => WeatherBg(
                weatherType: WeatherType.middleRainy,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Sun" => WeatherBg(
                weatherType: WeatherType.sunny,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Drought" => WeatherBg(
                weatherType: WeatherType.hazy,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Storm" => WeatherBg(
                weatherType: WeatherType.heavyRainy,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Snow" => WeatherBg(
                weatherType: WeatherType.middleSnow,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Hail" => WeatherBg(
                weatherType: WeatherType.heavySnow,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Drizzle" => WeatherBg(
                weatherType: WeatherType.lightRainy,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            "Cloudy" => WeatherBg(
                weatherType: WeatherType.foggy,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            _ => WeatherBg(
                weatherType: WeatherType.overcast,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
          },
          //'Umbral-Storm','Radiant-Storm','Thunderstorm','Phantasmal-Rain','Rain','Sun',
          // 'Drought', 'Storm','Snow','Hail','Drizzle','Cloudy'
          //const StarsViewBackground(),
          Column(
            children: [
              CarouselSliderWidget(
                  controller: _carouselController,
                  onIndexChanged: (index) {
                    // Use the CarouselSliderWidget in the body
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  printableValue: printableValues,
                  preSymbol: preSymbol),
                  TextWidget(
                  region: regionList[randIndex],
                  currentIndex: currentIndex,
                  wind: wind,
                  direction: direction,
                  wetterBedingung: wetterBedingung,
                  roller: roller,
                  ),
                ],
              ),
            ],
          ),
        );
  }
}

class TextWidget extends StatelessWidget {
  final int currentIndex;
  final Regional region;
  final int wind;
  final String direction;
  final String wetterBedingung;
  final D20 roller;
  final String text = "1d6";

  const TextWidget(
      {super.key,
      required this.currentIndex,
      required this.wind,
      required this.direction,
      required this.wetterBedingung, required this.region, required this.roller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
        child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0),
          border: Border.all(width: 0.1, color: Colors.black54),
          borderRadius:
              const BorderRadius.all(Radius.circular(20) // Add a black border
                  ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.4),
              spreadRadius: 6,
              blurRadius: 8,
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextButton(
                    onPressed:
                        null, // made the Region Name clickable in a TextButton
                    child: Text(region.regionalName,
                        style: const TextStyle(
                          height: 1.6,
                          backgroundColor: Colors.transparent,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text( region.regionalDescription,
                    style: const TextStyle(
                      height: 2.0,
                      backgroundColor: Colors.transparent,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text( region.effectRegionalName,
                    style: const TextStyle(
                      height: 2.0,
                      backgroundColor: Colors.transparent,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                /*Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text( region.effectRegional1,
                        style: const TextStyle(
                          height: 1.15,
                          backgroundColor: Colors.transparent,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(roller.roll(region.roller1).toString(),
                      style: const TextStyle(
                      height: 1.15,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional2,
                      style: const TextStyle(
                      height: 1.15,
                      backgroundColor: Colors.transparent,
                      color: Colors.white,
                      ),
                    ),
                    Text(roller.roll(region.roller2).toString(),
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional3,
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      ),
                    ),
                    Text(roller.roll(region.roller3).toString(),
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional4,
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      ),
                    ),
                    Text(roller.roll(region.roller4).toString(),
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional5,
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),*/
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Weather Condition: ',
                          style: TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(wetterBedingung,
                          style: const TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Wind: ',
                      style: TextStyle(
                        height: 2.0,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Wind Direction: $direction',
                      style: const TextStyle(
                        height: 2.0,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Wind-Speed: $wind km/h',
                      style: const TextStyle(
                        height: 2.0,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      )),
                ),
              ],
            );
          },
        )
        ),
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

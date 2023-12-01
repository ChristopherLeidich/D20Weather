//import 'dart:io';
import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/Widgets/text_widget.dart';
import 'package:fantasy_weather_app/Widgets/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
import 'package:fantasy_weather_app/Widgets/Models/lists.dart';
import 'package:fantasy_weather_app/Widgets/starviewfield.dart';
import 'dart:math';

import 'package:d20/d20.dart';

//import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';

import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
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

class MyCustomAppBar extends StatefulWidget {
  const MyCustomAppBar({super.key});

  @override
  State<MyCustomAppBar> createState() => _MyCustomAppBarState();
}

class _MyCustomAppBarState extends State<MyCustomAppBar> {

  final CarouselController _carouselController = CarouselController();
  int currentIndex = 0;

  int wind = 0;
  double doubleValues = 0.0; //used for generating a random double Value
  String printableValues = '0.0'; //this is the temperature that gets printed in the End
  String preSymbol = '+'; //Symbol for negative/Positive Temperatures
  String direction = '';
  String wetterBedingung = '';
  int randIndex = 0;
  //late Timer _timer; //initializes The Timer

  //dice section
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
        negativeTemperature: false
    ),
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
      regionalTemperatureLimitPositive: 3,
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
        regionalTemperatureLimitPositive: 44,
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
        regionalTemperatureLimitPositive: 42,
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

  @override
  void initState() {
    super.initState();
    randomizer(); // Generate the first random value when the app is started

   /* _timer = Timer.periodic(
        const Duration(seconds: 4, milliseconds: 42
        ),
        (timer) {
      //Generates a new Random Value in the void randomizer() after a set amount of seconds
      randomizer();
    });*/
  }



  void randomizer() {
    setState(() {

      final random1 = Random();
      final random2 = Random();

      int help = 0;

      int regionalCases = Random().nextInt(2);
      direction = dirlist[random1.nextInt(dirlist.length)];
      wetterBedingung = wetterbedingunsliste[random2.nextInt(wetterbedingunsliste.length)];

      randIndex = random1.nextInt(regionList.length);

      wind = Random().nextInt(64);

      if(regionList[randIndex].negativeTemperature == true){
        switch (regionalCases) {
          case 0 :
            help = regionList[randIndex].regionalTemperatureLimitPositive;
            doubleValues = Random().nextDouble() * help;
            preSymbol = '+';
          case 1:
            help = regionList[randIndex].regionalTemperatureLimitPositive;
            doubleValues = Random().nextDouble() * help;
            preSymbol = '-';
          default:
            doubleValues = 1;
            preSymbol = '+';
        }
      }else {
        help = regionList[randIndex].regionalTemperatureLimitPositive;
        doubleValues = Random().nextDouble() * help;
            preSymbol = '+';
      }
      printableValues = doubleValues.toStringAsFixed(
          1); //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to prevent memory leaks
    //_timer.cancel();
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
                  preSymbol: preSymbol,
                  onPageChanged: () {
                    randomizer();
                    },
                  ),
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

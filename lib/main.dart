import 'package:fantasy_weather_app/Widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/Widgets/text_widget.dart';
import 'package:fantasy_weather_app/Widgets/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
import 'package:fantasy_weather_app/Widgets/Models/lists.dart';
import 'package:fantasy_weather_app/Widgets/starviewfield.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
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

  double doubleValues = 0.0; //used for generating a random double Value
  String printableValues = '0.0'; //this is the temperature that gets printed in the End
  String preSymbol = '+'; //Symbol for negative/Positive Temperatures

  int randIndex = 0;


  @override
  void initState() {
    super.initState();
    randomizer(); // Generate the first random value when the app is started
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
            help = regionList[randIndex].regionalTemperatureLimitNegative;
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
      printableValues = doubleValues.toStringAsFixed(1);
      //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    });
  }

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



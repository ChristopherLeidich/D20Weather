import 'package:fantasy_weather_app/Widgets/Models/themes.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_weather_app/Widgets/text_widget.dart';
import 'package:fantasy_weather_app/Widgets/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantasy_weather_app/Widgets/drawer_widget.dart';
import 'package:fantasy_weather_app/Widgets/Models/lists.dart';
import 'package:fantasy_weather_app/Widgets/starviewfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Widgets/randomizer.dart';
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

class _MyCustomAppBarState extends State<MyCustomAppBar>
    with SingleTickerProviderStateMixin {
  // Animation controller
  late AnimationController _animationController;
  // This is used to animate the icon of the main FAB
  late Animation<double> _buttonAnimatedIcon;
  // This is used for the child FABs
  late Animation<double> _translateButton;
  // This variable determines whether the child FABs are visible or not
  bool _isExpanded = false;

  final CarouselController _carouselController = CarouselController();

  late bool _hasRandomized = false;

  @override
  void initState() {
    // for the FAB menu
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        // on every change of value
        setState(() {});
      });
    _buttonAnimatedIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _translateButton = Tween<double>(
      begin: 100,
      end: -20,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    super.initState();
    // randomizes once when page is opened
    if (_hasRandomized) {
      randomizer();
      _hasRandomized = true;
    }
  }

  // dispose the animation controller
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // This function is used to expand/collapse the children floating buttons
  // It will be called when the primary FAB (with menu icon) is pressed
  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isExpanded = !_isExpanded;
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
                Color(0xff1affff),
                Colors.lightBlue,
                Colors.blue
              ], // Your gradient colors
            ),
          ),
        ),
        title: const Align(
            alignment: Alignment.centerRight, child: Text('D20Weather')),
        leading: Builder(
          // menu button
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.list_outlined,
              color: Colors.white70,
              shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 0.3)],
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          // change background according to weather situation
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
                  setState(() {
                    randIndex = index;
                  });
                },
                randIndex: randIndex,
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
      //column of FABs that expand on click of main FAB
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //set end position of buttons through transform
          Transform(
            transform: Matrix4.translationValues(
              0,
              _translateButton.value * 3,
              0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                /* Save Current Snapshot Widget State in Temp either Locally or on the Server */
              },
              child: const Icon(Icons.bookmark_add),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * 2,
              0.0,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                _carouselController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ),

          // This is the primary FAB
          FloatingActionButton(
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _buttonAnimatedIcon,
            ),
          ),
        ],
      ),
    );
  }
}

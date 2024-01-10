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
import 'package:fantasy_weather_app/Widgets/expandablefab.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:parallax_rain/parallax_rain.dart';

/*void main() async {
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
      home: const WeatherD20(),
    );
  }
}

class WeatherD20 extends StatefulWidget {
  const WeatherD20({super.key});

  @override
  State<WeatherD20> createState() => _WeatherD20state();
}

class _WeatherD20state extends State<WeatherD20> {
  static const _actionTitles = ['Save Region', 'Upload Photo', 'Upload Video'];

  final CarouselController _carouselController = CarouselController();

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    randomizer();
    super.initState();
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
          /// change background according to weather situation
          switch (weatherList[weatherIndex].weatherName) {
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

      /// column of FABs that expand on click of main FAB
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 2),
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

/*
class _DiceRollerScreen extends StatefulWidget {
  final RegExp dicePattern = RegExp(r'(\d+)d(\d+)');
  late String diceResult;
  final TextEditingController _diceController = TextEditingController();
  late Match singleMatch;

  _DiceRollerScreen({super.key});
  @override
  State<_DiceRollerScreen> createState() => _DiceRollerScreen();

  String diceRollResult(value) {
    return diceResult = roller.roll(value).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      TextFormField(
        controller: _diceController,
        maxLength: 6,
        decoration: const InputDecoration(
            labelText: 'Dice Roller',
            hintText: 'Enter a valid Dice. Example: 1d20\n'
                'Number in front = Number of Dices\n'
                'Number behind = Number of Faces'),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a correct dice expression.';
          }

          singleMatch = dicePattern.firstMatch(value) as Match;

          return null;
        },
      ),
      IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () async {
            await diceRollResult(_diceController.value);
          }),
      SizedBox(height: 10.0, child: Text('Result: $diceRollResult'))
    ]));
  }
}
*/

void _showAction(BuildContext context) {
  final RegExp dicePattern = RegExp(r'(\d+)d(\d+)');
  final TextEditingController diceController = TextEditingController();
  final text = diceController.text;
  //bool roll = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    diceController.dispose();
  }

  Future<String> diceRollResult(text) async {
    return roller.roll(text).toString();
  }

  late String diceResult = '';

  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SingleChildScrollView(
            child: Column(children: [
          TextFormField(
            controller: diceController,
            maxLength: 6,
            decoration: const InputDecoration(
                labelText: 'Dice Roller',
                hintText: 'Enter a valid Dice. Example: 1d20\n'
                    'Number in front = Number of Dices\n'
                    'Number behind = Number of Faces'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a correct dice expression.';
              }

              Match singleMatch = dicePattern.firstMatch(value) as Match;
              if (singleMatch[0] == null) {
                return 'Enter a correct dice expression';
              } else {
                print(singleMatch[0]);
              }
              return null;
            },
          ),
          SizedBox(height: 20.0, child: Text('Result: $diceResult')),
        ])),
        actions: [
          TextButton(
              onPressed: () async {
                //roll = true;
                String tempResult = await diceRollResult(text);
                diceResult = tempResult;
              },
              child: const Text('ROLL')),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CLOSE'),
          ),
        ],
      );
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme,
      home: const WeatherD20(),
    );
  }
}

class WeatherD20 extends StatefulWidget {
  const WeatherD20({super.key});

  @override
  State<WeatherD20> createState() => _WeatherD20state();
}

class _WeatherD20state extends State<WeatherD20> {
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    randomizer();
    super.initState();
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
          /// change background according to weather situation
          switch (weatherList[weatherIndex].weatherName) {
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

      /// column of FABs that expand on click of main FAB
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () => _showAction(context),
            icon: const Icon(Icons.casino),
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }
}

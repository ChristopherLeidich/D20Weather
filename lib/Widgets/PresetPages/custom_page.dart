import 'dart:math';

import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:substitute/substitute.dart';

import '../Models/lists.dart';
import '../drawer_widget.dart';
import '../expandables/randomizer.dart';
import '../expandables/starviewfield.dart';

class ItemDetails extends StatefulWidget{

  const ItemDetails({super.key, required this.imageMap, required this.itemID});
  final Map<String, dynamic> imageMap;
  final String itemID;

  @override
  State<ItemDetails> createState() => _ItemdetailState();
}

class _ItemdetailState extends State<ItemDetails> {

  final user = FirebaseAuth.instance.currentUser;

  late final DocumentReference reference;
  late final docID = widget.itemID;


  late final Map data = widget.imageMap;

  late final List<dynamic> users = data['allowedUsers'];

  late final List<PaletteColor> colors;
  final List<Color> invertedColors = [];

  late double negativeTempL = data['negative_temperature_limit'];
  late double positiveTempL = data['positive_temperature_limit'];
  late bool negativeTemp = data['negative_temperature'];
  int cases = 0;
  String temperature ="";

  void temp() {
    cases = Random().nextInt(2);
    if(negativeTemp == true){
      switch(cases){
        case 0:
          temperature = '+ ${(Random().nextDouble() * positiveTempL + weatherList[weatherIndex].weatherTemperatureModifer).abs().toStringAsFixed(1)} °C';
          break;
        case 1:
          temperature = '- ${(Random().nextDouble() * negativeTempL + weatherList[weatherIndex].weatherTemperatureModifer).abs().toStringAsFixed(1)} °C';
          break;
        default:
          temperature = '+ ${(Random().nextDouble() * positiveTempL + weatherList[weatherIndex].weatherTemperatureModifer).abs().toStringAsFixed(1)} °C';
          break;
      }
    } else {
      temperature = '+ ${(Random().nextDouble() * positiveTempL + weatherList[weatherIndex].weatherTemperatureModifer).abs().toStringAsFixed(1)} °C';
    }
  }

  bool creator(){
    if(data['allowedUsers'][0] == user?.uid){
      return true;
    } else{
      return false;
    }
  }

  Color getInvertedColor(Color color) {
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }

  _updatePalettes() async{
    final PaletteGenerator generator =
    await PaletteGenerator.fromImageProvider(
        NetworkImage(data['ImageURL']),
        size: const Size(200, 100)
    );
    colors.add(generator.lightMutedColor != null    //0
        ? generator.lightMutedColor!
        : PaletteColor(Colors.blue, 0));

    colors.add(generator.darkMutedColor != null     //1
        ? generator.darkMutedColor!
        : PaletteColor(Colors.blue, 1));

    colors.add(generator.darkVibrantColor != null   //2
        ? generator.darkVibrantColor!
        : PaletteColor(Colors.blue, 2));

    colors.add(generator.lightVibrantColor != null   //3
        ? generator.lightVibrantColor!
        : PaletteColor(Colors.blue, 3));

    colors.add(generator.dominantColor != null      //4
        ? generator.dominantColor!
        : PaletteColor(Colors.blue, 4));

    colors.add(generator.vibrantColor != null       //5
        ? generator.vibrantColor!
        : PaletteColor(Colors.blue, 5));

    for (PaletteColor paletteColor in colors) {
      Color invertedColor = getInvertedColor(paletteColor.color);
      invertedColors.add(invertedColor);
    }
    setState(() {
    });
  }
  final TextEditingController _addAllowedUsers = TextEditingController();

  Future openDialog() => showDialog(context: context, builder: (context) => AlertDialog(
    title: const Text('Add other users to view this page'),
    content: TextField(
      autofocus: true,
      controller: _addAllowedUsers,
      decoration: const InputDecoration(hintText: "Paste a Friends UID here"),
    ),
    actions: [
      TextButton(
        onPressed: () async {
          Navigator.of(context).pop();
          String addAllowedUser = _addAllowedUsers.text.trim();
          users.add(addAllowedUser);
          await FirebaseFirestore.instance.collection('custom_page_data').doc(docID).update({'allowedUsers': users});
      },
          child: const Text("Add to List"))
    ],
  ));


  @override
  void initState(){
    super.initState();
    temp();
    colors = [];
    _updatePalettes();
  }

  final RegExp dicePattern = RegExp(r'\[\[(\d+)d((\d+)(\+\d+)?)\]\]');

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 36,
              flexibleSpace: Container(
                decoration:  BoxDecoration(
                  gradient:  LinearGradient(
                    colors: [
                      colors[4].color,
                      colors[5].color,
                      colors[0].color,
                    ], /// Generated gradient colors
                  ),
                ),
              ),
              title: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text('${data['title']}',
                  style: TextStyle(
                    color: invertedColors[0]
                  ),
                ),
                Visibility(
                  visible: creator(),
                  child: GestureDetector(
                      onTap: () {
                        openDialog();
                      },
                      child: Icon(Icons.star, color: invertedColors[0])
                      )
                    )
                   ]
                )
              ),
              leading: Builder(
                builder: (context) =>
                    IconButton(
                      icon: const Icon(
                        Icons.list_outlined, color: Colors.grey,),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              ),
            ),
            drawer: const MyDrawer(),
            body: Stack(
                children: [
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
               colors.isNotEmpty ?
                  Column(
                      children: [
                        Stack(
                          children: [
                            Image.network('${data['ImageURL']}',
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 4,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                fit: BoxFit.fill
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Text(temperature,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0),
                                      border: Border.all(
                                          width: 0.1, color: Colors.black54),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                              20) // Add a black border
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.blueAccent.withOpacity(
                                              0.4),
                                          spreadRadius: 6,
                                          blurRadius: 8,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Scrollable(
                                      axisDirection: AxisDirection.down,
                                      viewportBuilder: (BuildContext context,
                                          ViewportOffset position) {
                                        String subFireData = data['region_effect'];

                                        Iterable<Match> matches =
                                        dicePattern.allMatches(data['region_effect']);

                                        /// Extract the matched strings without brackets
                                        List<String> diceStrings = matches.map((match) => match.group(1)!).toList();
                                        List<String> diceSides = matches.map((match) => match.group(2)!).toList();
                                        List<String> diceValues = [];
                                        List<String> diceResults = [];

                                        for (int i = 0; i < diceStrings.length;) {
                                          diceValues.add("${diceStrings[i]}d${diceSides[i]}");
                                          diceResults.add('[${roller.roll(diceValues[i]).toString()}]'
                                          );

                                          final sub = Substitute(
                                            find: r'\[\[(\d+)d((\d+)(\+\d+)?)\]\]',
                                            replacement: diceResults[i],
                                            global: false,
                                          );
                                          i++;

                                          subFireData = sub.apply(subFireData);
                                        }
                                        return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (
                                                      BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Basic Stats of ${data['region_name']}'),
                                                      content: Container( // Wrapping with a container to apply constraints
                                                    constraints: BoxConstraints( // Apply constraints here
                                                    minWidth: 0,
                                                      minHeight: 0,// Min width is 0, to allow the widget to be as small as possible
                                                    maxWidth: MediaQuery.of(context).size.width,
                                                    maxHeight: MediaQuery.of(context).size.height * 0.1,
                                                    ),
                                                      child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                                "Positive Temperature Limit: \t+${data['positive_temperature_limit']
                                                                    .toString()}"),
                                                            Text(
                                                                "Negative Temperature Limit: \t-${data['negative_temperature_limit'].toString()}"),
                                                            Text(
                                                                "Maximum Wind Speed:\t\t\t\t${weatherList[weatherIndex].weatherWindspeed.toString()} km/h"),
                                                          ]
                                                        )
                                                      )
                                                    );
                                                  },
                                                );
                                              },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      3.0),
                                                  child: Text(
                                                      data['region_name'],
                                                      style: const TextStyle(
                                                        height: 2.0,
                                                        backgroundColor: Colors
                                                            .transparent,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 18,
                                                      )
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: ExpandableText(
                                                  data['region_description'],
                                                  style: const TextStyle(
                                                    height: 2.0,
                                                    backgroundColor: Colors
                                                        .transparent,
                                                    color: Colors.white,
                                                  ),
                                                  expandText: 'show more',
                                                  collapseText: 'show less',
                                                  maxLines: 1,
                                                  linkColor: Colors.black,
                                                  animation: true,
                                                  expanded: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: Text(
                                                  data['region_effect_name'],
                                                  style: const TextStyle(
                                                    height: 2.0,
                                                    backgroundColor: Colors
                                                        .transparent,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .all(5.0),
                                                    child: ExpandableText(
                                                      subFireData,
                                                      style: const TextStyle(
                                                        height: 2.0,
                                                        backgroundColor: Colors
                                                            .transparent,
                                                        color: Colors.white,
                                                      ),
                                                      expandText: 'show more',
                                                      collapseText: 'show less',
                                                      maxLines: 1,
                                                      linkColor: Colors.black,
                                                      animation: true,
                                                      expanded: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: Text(
                                                    weatherList[weatherIndex]
                                                        .weatherName,
                                                    style: const TextStyle(
                                                      height: 4.0,
                                                      backgroundColor: Colors
                                                          .transparent,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                    )
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: ExpandableText(
                                                  weatherList[weatherIndex]
                                                      .weatherDescription,
                                                  style: const TextStyle(
                                                    height: 2.0,
                                                    backgroundColor: Colors
                                                        .transparent,
                                                    color: Colors.white,
                                                  ),
                                                  expandText: 'show more',
                                                  collapseText: 'show less',
                                                  maxLines: 1,
                                                  linkColor: Colors.black,
                                                  animation: true,
                                                  expanded: true,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Text('Wind: ',
                                                    style: TextStyle(
                                                      height: 2.0,
                                                      backgroundColor: Colors
                                                          .transparent,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                    )
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: Text(
                                                    'Wind Direction: $direction',
                                                    style: const TextStyle(
                                                      height: 2.0,
                                                      backgroundColor: Colors
                                                          .transparent,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                    5.0),
                                                child: Text(
                                                    'Wind-Speed: $wind km/h',
                                                    style: const TextStyle(
                                                      height: 2.0,
                                                      backgroundColor: Colors
                                                          .transparent,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            ]);
                                      },
                                    )
                                )
                            )
                        )
                      ]
                  )
                  :  const Center(
                      child: CircularProgressIndicator(), // Step 2: Display loading indicator if colors are not loaded
                    ),
        ]
      )
    );
  }
}
/// Here is an Example how the collected Data is being called:
///
///    Column(
///           children: [
///              Image.network('${data['ImageURL']}',
///                 height: MediaQuery.of(context).size.height / 4,
///                 width: MediaQuery.of(context).size.width,
///                 fit: BoxFit.fill),
///                 Text('${data['region_name']}'),
///                 Text('${data['region_description']}'),
///                 Text('${data['region_effect']}'),
///                 ],
///              )
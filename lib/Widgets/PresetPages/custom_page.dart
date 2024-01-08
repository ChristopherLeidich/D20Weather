import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:parallax_rain/parallax_rain.dart';

import '../Models/lists.dart';
import '../drawer_widget.dart';
import '../randomizer.dart';
import '../starviewfield.dart';

class ItemDetails extends StatefulWidget{


  ItemDetails({super.key, required this.itemId}) {
    final reference = FirebaseFirestore.instance.collection('custom_page_data').doc(itemId);
    _futureData = reference.get();

  }
  late final Future<DocumentSnapshot> _futureData;
  final String itemId;

  @override
  State<ItemDetails> createState() => _ItemdetailState();
}

class _ItemdetailState extends State<ItemDetails> {


  late final String itemId;
  late final DocumentReference reference;

  late final Map data;

  late final List<PaletteColor> colors;
  final List<Color> invertedColors = [];

  Color getInvertedColor(Color color) {
    return Color.fromARGB(
      color.alpha,
      255 - color.red,
      255 - color.green,
      255 - color.blue,
    );
  }



  @override
  void initState(){
    super.initState();
    colors = [];
    _updatePalettes();
  }

  _updatePalettes() async{
      final PaletteGenerator generator =
      await PaletteGenerator.fromImageProvider(
          NetworkImage(data['ImageURL']),
          size: const Size(200, 100)
      );
      colors.add(generator.lightMutedColor != null    //0
          ? generator.lightMutedColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.darkMutedColor != null     //1
          ? generator.darkMutedColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.darkVibrantColor != null   //2
          ? generator.darkVibrantColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.lightVibrantColor != null   //3
          ? generator.lightVibrantColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.dominantColor != null      //4
          ? generator.dominantColor!
          : PaletteColor(Colors.blue, 2));

      colors.add(generator.vibrantColor != null       //5
          ? generator.vibrantColor!
          : PaletteColor(Colors.blue, 2));

      for (PaletteColor paletteColor in colors) {
        Color invertedColor = getInvertedColor(paletteColor.color);
        invertedColors.add(invertedColor);
      }

      setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: widget._futureData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('An error occurred ${snapshot.error}'));
        }

        if (snapshot.hasData) {
          //Get the data
          DocumentSnapshot documentSnapshot = snapshot.data;
          data = documentSnapshot.data() as Map;

          //display the data
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 36,
              flexibleSpace: Container(
                decoration:  BoxDecoration(
                  gradient:  LinearGradient(
                    colors: [
                      colors[4].color,
                      colors[5].color,
                      colors[0].color
                    ], // Your gradient colors
                  ),
                ),
              ),
              title: Align(
                alignment: Alignment.centerRight,
                child: Text('${data['title']}',
                  style: TextStyle(
                    color: invertedColors[3]
                  ),
                ),
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
            Column(
              children: [
                Image.asset('${data['Region Images']}',
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill),
                Text('${data['region_name']}'),
                Text('${data['region_description']}'),
                Text('${data['region_effekt']}'),
              ],
            ),
            ]
            )
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
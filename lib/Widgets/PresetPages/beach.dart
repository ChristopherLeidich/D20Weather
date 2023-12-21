import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:parallax_rain/parallax_rain.dart';

import '../Models/lists.dart';
import '../drawer_widget.dart';

import '../randomizer.dart';
import '../starviewfield.dart';
import '../text_widget.dart';

class BeachPage extends StatefulWidget {
  const BeachPage({super.key, required this.currentIndex, required this.wind, required this.direction, required this.wetterBedingung, required this.roller, required this.region});

  final Regional region;
  final int currentIndex;
  final int wind;
  final String direction;
  final String wetterBedingung;
  final dynamic roller;

  @override
  State<BeachPage> createState() => _BeachState();
}


class _BeachState extends State<BeachPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 36,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                Colors.green,
                Colors.lightBlue,
                Colors.yellow
                ], // Your gradient colors
              ),
            ),
          ),
      title: const Align(
          alignment: Alignment.centerRight,
              child: Text('D20Weather')),
              leading: Builder(
              builder: (context) => IconButton(
                    icon: const Icon(Icons.list_outlined, color: Colors.grey,),
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
          Image.asset('assets/images/Beach(1080x600).png',
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
          TextWidget(
            region: regionList[3],
            currentIndex: 3,
            wind: wind,
            direction: direction,
            wetterBedingung: wetterBedingung,
            roller: roller,
          ),
        ],
      ),
      ]
    )
    );
  }
}
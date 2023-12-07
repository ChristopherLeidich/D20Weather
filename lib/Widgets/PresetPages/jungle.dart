import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Models/lists.dart';
import '../drawer_widget.dart';
import '../randomizer.dart';
import '../text_widget.dart';

class JunglePage extends StatefulWidget {
  const JunglePage({super.key, required this.currentIndex, required this.wind, required this.direction, required this.wetterBedingung, required this.roller, required this.region});

  final Regional region;
  final int currentIndex;
  final int wind;
  final String direction;
  final String wetterBedingung;
  final dynamic roller;

  @override
  State<JunglePage> createState() => _JungleState();
}


class _JungleState extends State<JunglePage> {

  Randomizer randomizer = Randomizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 36,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightGreen,
                Colors.lime,
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
      body: Column(
        children: [
          Image.asset('assets/images/Jungle(1080x600).png',
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
    Flexible(
    child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child:
          Scrollable(
          axisDirection: AxisDirection.down,
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return TextWidget(
                region: regionList[0],
                currentIndex: 0,
                wind: randomizer.wind,
                direction: randomizer.direction,
                wetterBedingung: randomizer.wetterBedingung,
                roller: roller,
                );
              }
            ),
          )
         )
        ],
      ),
    );
  }
}
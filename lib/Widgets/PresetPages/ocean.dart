import 'package:flutter/material.dart';

import '../Models/lists.dart';
import '../drawer_widget.dart';

import '../randomizer.dart';
import '../text_widget.dart';

class OceanPage extends StatefulWidget {
  const OceanPage({super.key, required this.currentIndex, required this.wind, required this.direction, required this.wetterBedingung, required this.roller, required this.region});

  final Regional region;
  final int currentIndex;
  final int wind;
  final String direction;
  final String wetterBedingung;
  final dynamic roller;

  @override
  State<OceanPage> createState() => _OceanState();
}


class _OceanState extends State<OceanPage> {

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
      body: Column(
        children: [
          Image.asset('assets/images/Ocean(1080x600).png',
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill),
          TextWidget(
            region: regionList[2],
            currentIndex: 2,
            wind: wind,
            direction: direction,
            wetterBedingung: wetterBedingung,
            roller: roller,
          ),
        ],
      ),
    );
  }
}
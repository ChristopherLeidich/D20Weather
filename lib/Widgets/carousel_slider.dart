import 'package:fantasy_weather_app/Widgets/Models/lists.dart';
import 'package:fantasy_weather_app/Widgets/PresetPages/desert.dart';
import 'package:fantasy_weather_app/Widgets/PresetPages/forest.dart';
import 'package:fantasy_weather_app/Widgets/randomizer.dart';
import 'package:flutter/material.dart';

//import 'Widgets/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../main.dart';
import 'PresetPages/beach.dart';
import 'PresetPages/glacier.dart';
import 'PresetPages/jungle.dart';
import 'PresetPages/ocean.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    required this.pageController,
    required this.onIndexChanged,
    required this.onPageChanged,
    super.key,
    required this.randIndex,
  });

  final int randIndex;
  final CarouselController pageController;
  final ValueChanged<int> onIndexChanged;
  final VoidCallback onPageChanged;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.pageController,
      items: [
        switch (randIndex) {
          0 => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JunglePage(
                                      currentIndex: 0,
                                      wind: wind,
                                      direction: direction,
                                      wetterBedingung: '',
                                      region: regionList[0],
                                      roller: roller))); // Do something.
                        },
                        child: Image.asset('assets/images/Jungle(1080x600).png',
                            height: 450, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$preSymbol $printableValues °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          1 => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GlacierPage(
                                      currentIndex: 1,
                                      wind: wind,
                                      direction: direction,
                                      wetterBedingung: '',
                                      region: regionList[1],
                                      roller: roller))); // Do something.
                        },
                        child: Image.asset(
                            'assets/images/Glacier(1080x600).png',
                            height: 450,
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$preSymbol $printableValues °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          2 => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OceanPage(
                                      currentIndex: 2,
                                      wind: wind,
                                      direction: direction,
                                      wetterBedingung: '',
                                      region: regionList[2],
                                      roller: roller))); // Do something.
                        },
                        child: Image.asset('assets/images/Ocean(1080x600).png',
                            height: 450, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$preSymbol $printableValues °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          3 => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BeachPage(
                                      currentIndex: 3,
                                      wind: wind,
                                      direction: direction,
                                      wetterBedingung: '',
                                      region: regionList[3],
                                      roller: roller))); // Do something.
                        },
                        child: Image.asset('assets/images/Beach(1080x600).png',
                            height: 450, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$preSymbol $printableValues °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          4 => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForestPage(
                                      currentIndex: 4,
                                      wind: wind,
                                      direction: direction,
                                      wetterBedingung: '',
                                      region: regionList[4],
                                      roller: roller))); // Do something.
                        },
                        child: Image.asset('assets/images/Forest(1080x600).png',
                            height: 450, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$preSymbol $printableValues °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          5 => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DesertPage(
                                      currentIndex: 5,
                                      wind: wind,
                                      direction: direction,
                                      wetterBedingung: '',
                                      region: regionList[5],
                                      roller: roller))); // Do something.
                        },
                        child: Image.asset('assets/images/Desert(1080x600).png',
                            height: 450, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$preSymbol $printableValues °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          _ => Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp()));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Something went Wrong and no Number could be Generated\n Error-Code: CE0001RNG')));
                          } // Do something.
                        },
                        child: Image.asset('44.jpg',
                            height: 450, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '$randIndex $printableValues °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        },
      ],
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        aspectRatio: 2.0,
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
        initialPage: 0,
        height: MediaQuery.of(context).size.height / 3,
        onPageChanged: (index, reason) {
          widget.onIndexChanged(index);
          widget.onPageChanged();
          randomizer();
          // Notify the parent widget when the page changes
          /*widget.onIndexChanged(index);
          setState(() {
            images.removeAt(index);
          })
          if (index < images.length) {
            setState(() {
              images.insert(index, image.index() );
            });;*/
        },
      ),
    );
  }
}

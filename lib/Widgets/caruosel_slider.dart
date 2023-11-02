import 'package:flutter/material.dart';

//import 'Widgets/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key, required this.controller, required this.onIndexChanged, required this.printableValue, required this.preSymbol});

  final CarouselController controller;
  final ValueChanged<int> onIndexChanged;

  final String printableValue; //this is the temperature that gets printed in the End
  final String preSymbol;      //Symbol for negative/Positive Temperatures

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      items: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Expanded(child: Image.asset('assets/images/glacier.jpg'),
                ),
              ),
              Center(
                child: Text('$preSymbol $printableValue °C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Expanded(child: Image.asset('assets/images/KT3A7OD.jpeg'),
                ),
              ),
              Center(
                child: Text('$preSymbol $printableValue °C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Expanded(child: Image.asset('assets/images/9502ac62b81f208465c7beb0d4338c77.jpg'),
                ),
              ),
              Center(
                child: Text('$preSymbol $printableValue °C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        aspectRatio: 2.0,
        enableInfiniteScroll: true,
        viewportFraction: 0.8,
        initialPage: 0,
        onPageChanged: (index, reason) {
          // Notify the parent widget when the page changes
          onIndexChanged(index);
        },
      ),
    );
  }
}
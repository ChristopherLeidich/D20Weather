import 'package:flutter/material.dart';

//import 'Widgets/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    required this.controller,
    required this.onIndexChanged,
    required this.printableValue,
    required this.preSymbol,
    required this.onPageChanged,

    super.key,
  });

  final CarouselController controller;
  final ValueChanged<int> onIndexChanged;
  final String printableValue;
  final String preSymbol;
  final VoidCallback onPageChanged;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.controller,
      items: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                  child: Image.asset('assets/images/glacier.jpg',
                      height: 450, fit: BoxFit.fill),
                ),
              ),
              Center(
                child: Text(
                  '${widget.preSymbol} ${widget.printableValue} °C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
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
                  child: Image.asset('assets/images/KT3A7OD.jpeg',
                      height: 450, fit: BoxFit.fill),
                ),
              ),
              Center(
                child: Text(
                  '${widget.preSymbol} ${widget.printableValue} °C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
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
                  child: Image.asset(
                      'assets/images/9502ac62b81f208465c7beb0d4338c77.jpg',
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.height / 1.2,
                      fit: BoxFit.fill),
                ),
              ),
              Center(
                child: Text(
                  '${widget.preSymbol} ${widget.printableValue} °C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
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
        height: MediaQuery.of(context).size.height / 3,
        onPageChanged: (index, reason) {
          widget.onIndexChanged(index);
          widget.onPageChanged();
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

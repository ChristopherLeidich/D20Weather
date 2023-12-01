import 'package:flutter/material.dart';
import 'package:d20/d20.dart';
import 'package:flutter/rendering.dart';

import '../main.dart';
import 'Models/lists.dart';

class TextWidget extends StatelessWidget {
  final int currentIndex;
  final Regional region;
  final int wind;
  final String direction;
  final String wetterBedingung;
  final D20 roller;
  final String text = "1d6";

  const TextWidget(
      {super.key,
        required this.currentIndex,
        required this.wind,
        required this.direction,
        required this.wetterBedingung, required this.region, required this.roller});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
              border: Border.all(width: 0.1, color: Colors.black54),
              borderRadius:
              const BorderRadius.all(Radius.circular(20) // Add a black border
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.4),
                  spreadRadius: 6,
                  blurRadius: 8,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Scrollable(
              axisDirection: AxisDirection.down,
              viewportBuilder: (BuildContext context, ViewportOffset position) {
                return Column(
                  //switch case später einfügen
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                        onPressed:
                        null, // made the Region Name clickable in a TextButton
                        child: Text(region.regionalName,
                            style: const TextStyle(
                              height: 1.6,
                              backgroundColor: Colors.transparent,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text( region.regionalDescription,
                        style: const TextStyle(
                          height: 2.0,
                          backgroundColor: Colors.transparent,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text( region.effectRegionalName,
                        style: const TextStyle(
                          height: 2.0,
                          backgroundColor: Colors.transparent,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    /*Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text( region.effectRegional1,
                        style: const TextStyle(
                          height: 1.15,
                          backgroundColor: Colors.transparent,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(roller.roll(region.roller1).toString(),
                      style: const TextStyle(
                      height: 1.15,
                      backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional2,
                      style: const TextStyle(
                      height: 1.15,
                      backgroundColor: Colors.transparent,
                      color: Colors.white,
                      ),
                    ),
                    Text(roller.roll(region.roller2).toString(),
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional3,
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      ),
                    ),
                    Text(roller.roll(region.roller3).toString(),
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional4,
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      ),
                    ),
                    Text(roller.roll(region.roller4).toString(),
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text( region.effectRegional5,
                      style: const TextStyle(
                        height: 1.15,
                        backgroundColor: Colors.transparent,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),*/
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('Weather Condition: ',
                              style: TextStyle(
                                height: 2.0,
                                backgroundColor: Colors.transparent,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(wetterBedingung,
                              style: const TextStyle(
                                height: 2.0,
                                backgroundColor: Colors.transparent,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Wind: ',
                          style: TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Wind Direction: $direction',
                          style: const TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Wind-Speed: $wind km/h',
                          style: const TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                          )),
                    ),
                  ],
                );
              },
            )
        ),
      ),
    );
  }
}
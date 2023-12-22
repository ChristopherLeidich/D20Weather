import 'package:flutter/material.dart';
import 'package:d20/d20.dart';
import 'package:flutter/rendering.dart';
import 'package:expandable_text/expandable_text.dart';
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
      required this.wetterBedingung,
      required this.region,
      required this.roller});

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
              borderRadius: const BorderRadius.all(
                  Radius.circular(20) // Add a black border
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
                      padding: const EdgeInsets.all(3.0),
                      child: Text(region.regionalName,
                          style: const TextStyle(
                            height: 2.0,
                            backgroundColor: Colors.transparent,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ExpandableText(
                        region.regionalDescription,
                        style: const TextStyle(
                          height: 2.0,
                          backgroundColor: Colors.transparent,
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
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        region.effectRegionalName,
                        style: const TextStyle(
                          height: 2.0,
                          backgroundColor: Colors.transparent,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                              child: ExpandableText(
                                '${region.effectRegional1} '
                                '[${roller.roll(region.roller1).toString()}] '
                                '${region.effectRegional2} '
                                '[${roller.roll(region.roller2).toString()}] '
                                '${region.effectRegional3} '
                                '[${roller.roll(region.roller3).toString()}] '
                                '${region.effectRegional4} '
                                '[${roller.roll(region.roller4).toString()}] '
                                '${region.effectRegional5}',
                                style: const TextStyle(
                                  height: 2.0,
                                  backgroundColor: Colors.transparent,
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
                          )
                        ),
                      ),
                    ],
                  ),
                ]
                );
              },
            )
        ),
      ),
    );
  }
}

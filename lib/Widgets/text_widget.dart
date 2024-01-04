import 'package:flutter/material.dart';
import 'package:d20/d20.dart';
import 'package:flutter/rendering.dart';
import 'package:expandable_text/expandable_text.dart';
import 'Models/lists.dart';
import 'package:substitute/substitute.dart';


class TextWidget extends StatelessWidget {
  final int currentIndex;
  final Regional region;
  final int wind;
  final String direction;
  final String wetterBedingung;
  final D20 roller;
  final String text = "1d6";

  TextWidget(
      {super.key,
      required this.currentIndex,
      required this.wind,
      required this.direction,
      required this.wetterBedingung,
      required this.region,
      required this.roller});

  final RegExp dicePattern = RegExp(r'\[\[(\d+)d(\d+)\]\]');


  @override
  Widget build(BuildContext context) {
    Iterable<Match> matches = dicePattern.allMatches(region.effectRegional);

    // Extract the matched strings without brackets
    List<String> diceStrings = matches.map((match) => match.group(1)!).toList();
    List<String> diceSides = matches.map((match) => match.group(2)!).toList();
    List<String> diceValues = [];
    List<String> diceResults = [];

    for(int i = 0; i < diceStrings.length; i++){
      diceValues.add("${diceStrings[i]}d${diceSides[i]}");
      diceResults.add(roller.roll(diceValues[i]).toString());
    }



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
                String substitutedEffectRegional = region.effectRegional;

                for (int i = 0; i < diceStrings.length; i++) {
                  final sub = Substitute(
                    find: r'\[\[(\d+)d(\d+)\]\]',
                    replacement: diceResults[i],
                    global: true,
                  );

                  substitutedEffectRegional = sub.apply(substitutedEffectRegional);
                }
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
                                substitutedEffectRegional,
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

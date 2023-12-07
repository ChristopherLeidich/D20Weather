import 'package:fantasy_weather_app/Widgets/Models/lists.dart';
import 'dart:math';

class Randomizer {

  double doubleValues = 0.0; //used for generating a random double Value
  int randIndex = 0;
  String printableValues = '0.0'; //this is the temperature that gets printed in the End
  String preSymbol = '+'; //Symbol for negative/Positive Temperatures
  int currentIndex = 0;
  String direction = '';
  String wetterBedingung = '';
  int wind = 0;
  int regionalCases = 0;

  void randomizer() {

      regionalCases = Random().nextInt(2);
      direction = dirlist[Random().nextInt(dirlist.length)];
      wetterBedingung = wetterbedingunsliste[Random().nextInt(wetterbedingunsliste.length)];

      randIndex = Random().nextInt(regionList.length);

      wind = Random().nextInt(64);


      if (regionList[randIndex].negativeTemperature == true) {
        switch (regionalCases) {
          case 0:
            //help = regionList[randIndex].regionalTemperatureLimitPositive;
            doubleValues = Random().nextDouble() * regionList[randIndex].regionalTemperatureLimitPositive;
            preSymbol = '+';
            printableValues = doubleValues.toStringAsFixed(1);

            break;
          case 1:
            //help = regionList[randIndex].regionalTemperatureLimitNegative;
            doubleValues = Random().nextDouble() * regionList[randIndex].regionalTemperatureLimitNegative;
            preSymbol = '-';
            printableValues = doubleValues.toStringAsFixed(1);
            break;
          default:
            doubleValues = 1;
            preSymbol = '+';
            printableValues = doubleValues.toStringAsFixed(1);

            break;
        }
      } else {
        //help = regionList[randIndex].regionalTemperatureLimitPositive;
        doubleValues = Random().nextDouble() * regionList[randIndex].regionalTemperatureLimitPositive;
        preSymbol = '+';
        printableValues = doubleValues.toStringAsFixed(1);

      }


      //printableValues = doubleValues.toStringAsFixed(1);
      //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    }
}

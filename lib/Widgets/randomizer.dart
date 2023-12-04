import 'package:fantasy_weather_app/Widgets/Models/lists.dart';
import 'dart:math';

class Randomizer {

  double doubleValues = 0.0; //used for generating a random double Value
  int randIndex = 0;
  String printableValues = '0.0'; //this is the temperature that gets printed in the End
  String preSymbol = '+'; //Symbol for negative/Positive Temperatures

  void randomizer() {
      final random1 = Random();
      final random2 = Random();

      int help = 0;

      int regionalCases = Random().nextInt(2);
      direction = dirlist[random1.nextInt(dirlist.length)];
      wetterBedingung =
      wetterbedingunsliste[random2.nextInt(wetterbedingunsliste.length)];

      randIndex = random1.nextInt(regionList.length);

      wind = Random().nextInt(64);

      if (regionList[randIndex].negativeTemperature == true) {
        switch (regionalCases) {
          case 0:
            help = regionList[randIndex].regionalTemperatureLimitPositive;
            doubleValues = Random().nextDouble() * help;
            preSymbol = '+';
          case 1:
            help = regionList[randIndex].regionalTemperatureLimitNegative;
            doubleValues = Random().nextDouble() * help;
            preSymbol = '-';
          default:
            doubleValues = 1;
            preSymbol = '+';
        }
      } else {
        help = regionList[randIndex].regionalTemperatureLimitPositive;
        doubleValues = Random().nextDouble() * help;
        preSymbol = '+';
      }
      printableValues = doubleValues.toStringAsFixed(1);
      //fixes the length of digits after the , to 1 (e.g. 1.1 instead of 1.00000001)
    }
}

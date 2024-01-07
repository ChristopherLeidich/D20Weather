import 'package:fantasy_weather_app/Widgets/Models/lists.dart';
import 'dart:math';


double doubleValues = 0.0; ///used for generating a random double Value
int randIndex = 0;
String printableValues = '0.0'; ///this is the temperature that gets printed in the End.
String preSymbol = '+'; ///Symbol for negative/Positive Temperatures
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

    wind = Random().nextInt(64); /// Needs to be replaced with a non-static Value provided by the weatherList inside the {@lists.dart}


    if (regionList[randIndex].negativeTemperature == true) {      ///checks if the Current Area allows for negative Temperatures to be generated
      switch (regionalCases) {                                    /// Takes a Random Value from Line 17
        case 0:                                                   /// Generate a Positive Temperature
          doubleValues = Random().nextDouble() * regionList[randIndex].regionalTemperatureLimitPositive;
          preSymbol = '+';                                        /// Set Pre-Symbol to "+"
          printableValues = doubleValues.toStringAsFixed(1);      /// make the Generated Value a String with 1 digit behind the ,
          break;
        case 1:                                                  /// Generate a Positive Temperature
          doubleValues = Random().nextDouble() * regionList[randIndex].regionalTemperatureLimitNegative;
          preSymbol = '-';                                        /// Set Pre-Symbol to "-"
          printableValues = doubleValues.toStringAsFixed(1);
          break;
        default:                                                  /// This is the Default Case just meant for Debugging Purposes. This Value should never be reached
          doubleValues = 1;
          preSymbol = '+';
          printableValues = doubleValues.toStringAsFixed(1);

          break;
      }
    } else {                                                    /// If there is no Negative Value saved in the first Place so regionList[randIndex].negativeTemperature is set to false execute this and generate a positive Value
      doubleValues = Random().nextDouble() * regionList[randIndex].regionalTemperatureLimitPositive;
      preSymbol = '+';
      printableValues = doubleValues.toStringAsFixed(1);

    }
  }


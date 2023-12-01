class Regional {
  final String regionalName;
  final String regionalDescription;
  final String effectRegionalName;
  final String effectRegionaldescription;
  final String effectRegional1;
  final String roller1;
  final String effectRegional2;
  final String roller2;
  final String effectRegional3;
  final String roller3;
  final String effectRegional4;
  final String roller4;
  final String effectRegional5;
  final int regionalTemperatureLimitPositive;
  final int regionalTemperatureLimitNegative;
  final bool negativeTemperature;

  Regional(
      {
        required this.regionalName,
        required this.regionalDescription,
        required this.effectRegionalName,
        required this.effectRegionaldescription,
        required this.effectRegional1,
        required this.roller1,
        required this.effectRegional2,
        required this.roller2,
        required this.effectRegional3,
        required this.roller3,
        required this.effectRegional4,
        required this.roller4,
        required this.effectRegional5,
        required this.regionalTemperatureLimitPositive,
        required this.regionalTemperatureLimitNegative,
        required this.negativeTemperature});
}

class Weather {
  final String weatherName;
  final String weatherDescription;
  final String weatherEffectname;
  final String weatherEffectdescription;
  final String weatherEffect;

  Weather(
      {required this.weatherName,
        required this.weatherDescription,
        required this.weatherEffectname,
        required this.weatherEffectdescription,
        required this.weatherEffect});
}
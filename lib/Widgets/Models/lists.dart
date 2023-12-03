import 'package:d20/d20.dart';

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

final List<Regional> regionList = [
  Regional(
      regionalName: 'Jungle',
      regionalDescription:
      'A jungle is land covered with dense forest and tangled vegetation, usually in tropical climates. '
          'It is hard for unprepared Partys to traverse the Area without issue.',
      effectRegionalName: 'Insect Plague',
      effectRegionaldescription:
      'Non Undead Creatures are constantly swarmed by \nTiny mosquitoes and other Insects',
      effectRegional1: 'Once every 1d6 [',
      roller1: '1d6',
      effectRegional2: '] Hours every Non-Undead Member of the Party has to roll \na basic DC15 Fortitude-Save or loose 1d2 ',
      roller2: '1d2',
      effectRegional3: ' HP.\nOn a critical Failure the Damage Dice Changes to 1d4 ',
      roller3: '1d4',
      effectRegional4: ' and the Party-Member will be contaminated by a random Decease',
      roller4: '1d0',
      effectRegional5: '.',
      regionalTemperatureLimitPositive: 48,
      regionalTemperatureLimitNegative: 0,
      negativeTemperature: false
  ),
  Regional(
    regionalName: 'Glacier',
    regionalDescription:  'A Cold barren Wasteland of Ice and Snow. '
        'The Cold Temperatures do little in the way of hospitability. \n'
        'To an unprepared Party Traversing these Icy Planes means almost certain Death.',
    effectRegionalName: 'Deadly Frost',
    effectRegionaldescription:  'The Cold is Clinging onto your Body, '
        'leaving you more Susceptible to harm from all Sources.',
    effectRegional1: 'For the Duration of your Stay every Member of the Party that does not have at least Cold-Resistance 5 has to roll a basic DC 18 Fortitude Save every 1d4 [',
    roller1: '1d4',
    effectRegional2: '] Hours or gain one Level of Enfeeblement and Take 1d6 [',
    roller2: '1d6',
    effectRegional3: '] Cold damage\n This Debuff lasts until the Character takes a Long-Rest in a warm-Location or until death.\n On a critical Failure they additionally gain a Stack of the Wounded Condition and the Damage-Dice Changes to 1d8 [',
    roller3: '1d8',
    effectRegional4: 'of Cold Damage.\n Party-Members with at least Cold-Resistance 5 do these Fortitude Saves instead every 1d8 [',
    roller4: '1d8',
    effectRegional5: '] Hours with the Same Effects on a Failure and Critical Failure.',
    regionalTemperatureLimitPositive: 3,
    regionalTemperatureLimitNegative: 48,
    negativeTemperature: true,
  ),
  Regional(
      regionalName: 'Ocean',
      regionalDescription: 'Description for Item 3',
      effectRegionalName: ' ',
      effectRegionaldescription: ' ',
      effectRegional1: ' ',
      roller1: '1d0',
      effectRegional2: ' ',
      roller2: '1d0',
      effectRegional3: ' ',
      roller3: '1d0',
      effectRegional4: ' ',
      roller4: '1d0',
      effectRegional5: ' ',
      regionalTemperatureLimitPositive: 44,
      regionalTemperatureLimitNegative: 4,
      negativeTemperature: true
  ),
  Regional(
      regionalName: 'Beach',
      regionalDescription: 'Description for Item 3',
      effectRegionalName: ' ',
      effectRegionaldescription: ' ',
      effectRegional1: ' ',
      roller1: '1d0',
      effectRegional2: ' ',
      roller2: '1d0',
      effectRegional3: ' ',
      roller3: '1d0',
      effectRegional4: ' ',
      roller4: '1d0',
      effectRegional5: ' ',
      regionalTemperatureLimitPositive: 42,
      regionalTemperatureLimitNegative: 0,
      negativeTemperature: false
  ),
  Regional(
      regionalName: 'Forest',
      regionalDescription: 'Description for Item 3',
      effectRegionalName: ' ',
      effectRegionaldescription: ' ',
      effectRegional1: ' ',
      roller1: '1d0',
      effectRegional2: ' ',
      roller2: '1d0',
      effectRegional3: ' ',
      roller3: '1d0',
      effectRegional4: ' ',
      roller4: '1d0',
      effectRegional5: ' ',
      regionalTemperatureLimitPositive: 22,
      regionalTemperatureLimitNegative: 24,
      negativeTemperature: true
  ),
  Regional(
      regionalName: 'Desert',
      regionalDescription: 'Description for Item 3',
      effectRegionalName: ' ',
      effectRegionaldescription: ' ',
      effectRegional1: ' ',
      roller1: '1d0',
      effectRegional2: ' ',
      roller2: '1d0',
      effectRegional3: ' ',
      roller3: '1d0',
      effectRegional4: ' ',
      roller4: '1d0',
      effectRegional5: ' ',
      regionalTemperatureLimitPositive: 54,
      regionalTemperatureLimitNegative: 10,
      negativeTemperature: true
  ),
];

final List<Weather> weatherList = [
  Weather(
      weatherName: 'Drizzle',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Drought',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Thunderstorm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Snow',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Hail',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Cloudy',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Radiant-Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Umbral-Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
  Weather(
      weatherName: 'Phantasmal-Rain',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'
  ),
];

var dirlist = [
  'North',
  'North-West',
  'West',
  'North-East',
  'East',
  'South',
  'South-West',
  'South-East'
];

var wetterbedingunsliste = [
  'Umbral-Storm',
  'Radiant-Storm',
  'Thunderstorm',
  'Phantasmal-Rain',
  'Rain',
  'Sun',
  'Drought',
  'Storm',
  'Snow',
  'Hail',
  'Drizzle',
  'Cloudy'
];

String direction = '';
String wetterBedingung = '';
final roller = D20();
int wind = 0;

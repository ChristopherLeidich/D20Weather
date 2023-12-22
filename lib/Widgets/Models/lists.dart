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
      {required this.regionalName,
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
          'A jungle is land covered with dense forest and tangled vegetation, '
          'usually in tropical climates. '
          'It is hard for unprepared parties to '
          'traverse the area without issues.',
      effectRegionalName: 'Insect Plague',
      effectRegionaldescription: 'Non-Undead creatures are constantly swarmed by \n'
          'tiny mosquitoes and other insects',
      effectRegional1: 'Once every 1d6 ',
      roller1: '1d6',
      effectRegional2: 'hour(s) every Non-Undead '
          'member of the party has to roll '
          'a basic DC15 Fortitude-Save or loose 1d2 ',
      roller2: '1d2',
      effectRegional3:
          'Hit-Points. On a critical failure the damage dice changes to 1d4 ',
      roller3: '1d4',
      effectRegional4:
          'and the party-member will get infected by a random disease based on the following 1d42',
      roller4: '1d42',
      effectRegional5:
          'more information on in-game diseases at: https://www.d20pfsrd.com/gamemastering/afflictions/diseases/diseases-paizo-inc/',
      regionalTemperatureLimitPositive: 48,
      regionalTemperatureLimitNegative: 0,
      negativeTemperature: false),
  Regional(
    regionalName: 'Glacier',
    regionalDescription: 'A cold barren wasteland of Ice and Snow. '
        'The cold temperatures do little in the way of hospitality. '
        'To an unprepared party traversing these icy planes means almost certain Death.',
    effectRegionalName: 'Deadly Frost',
    effectRegionaldescription: 'The cold is clinging onto your body, '
        'leaving you more susceptible to harm from all sources.',
    effectRegional1:
        'For the duration of your stay every member of the party '
        'who does not have at least [5] Cold-Resistance '
        'has to roll a basic DC [18] Fortitude Save every 1d4 ',
    roller1: '1d4',
    effectRegional2: 'hour(s) or gain one level of enfeeblement and take 1d6 ',
    roller2: '1d6',
    effectRegional3:
        'cold damage.\nThis debuff lasts until the character takes a Long-Rest in a warm location or until death.\nOn a critical failure they additionally gain a stack of the wounded condition and the damage dice changes to 1d8',
    roller3: '1d8',
    effectRegional4:
        'cold damage.\nparty members with at least cold resistance [5] have to role for the following fortitude save instead after every 1d8 ',
    roller4: '1d8',
    effectRegional5:
        'hour(s) with the same effect on failure or critical failure.',
    regionalTemperatureLimitPositive: 3,
    regionalTemperatureLimitNegative: 48,
    negativeTemperature: true,
  ),
  Regional(
      regionalName: 'Ocean',
      regionalDescription: 'Oceans are a wellspring of life to many Lifeforms. '
          'However not all of them are always on good Terms with Human-Society. '
          'As a Famous Fisher from the Astral Coast Once Said: "The Ocean is beautiful and '
          'bountiful to those fools that don`t have to work with it every day..."',
      effectRegionalName: 'Strong Waves',
      effectRegionaldescription: ' ',
      effectRegional1: ' ',
      roller1: '1d4',
      effectRegional2: ' ',
      roller2: '1d20',
      effectRegional3: ' ',
      roller3: '1d20',
      effectRegional4: ' ',
      roller4: '1d4',
      effectRegional5: ' ',
      regionalTemperatureLimitPositive: 44,
      regionalTemperatureLimitNegative: 4,
      negativeTemperature: true),
  Regional(
      regionalName: 'Beach',
      regionalDescription: 'Beaches are often not what the Common Man would picture of the word. Beaches can range from beautiful Glistening Beaches of Clear Water and Fine White Sand in Warm weathers to Literal Stormfronts of Raging Tides unhospitable to any who may think of exploring the area. In short You may never know for sure what you will encounter.',
      effectRegionalName: 'High and Low Tide',
      effectRegionaldescription: 'The Waning and Waxing of the Moon affects no Region as much as the Ocean. It is in a constant Mode of Change which makes survival in the long term an outright challenge.',
      effectRegional1: 'Roll a Dice. If the Result is even it is currently High-Tide. On an odd result it is Low Tide',
      roller1: '1d4',
      effectRegional2: 'High Tide: The Chance of encountering Creatures from the Sea is doubled and all Dice to determine the Amount of Creatures from withing the Ocean is doubled as Well. If a random Enconuter is a Sea-Creature roll 1d20',
      roller2: '1d20',
      effectRegional3: 'on an 18 or Higher one of The Creatures is an Elite Monster.\nLow Tide: The Chance of Encountering land-bound or amphibious Creatures is doubled and all Dice to determine the Amount of Creatures from land-bound or amphibious Creatures is doubled as Well. If a random Enconuter is not a Sea-Creature roll 1d20',
      roller3: '1d20',
      effectRegional4: 'on an 18 or Higher one of The Creatures is an Elite Monster. If the Encounter however is a Sea-Creature roll 1d4',
      roller4: '1d4',
      effectRegional5: '. The Amount of Creatures Rolled is in a weakened State when Encountered',
      regionalTemperatureLimitPositive: 42,
      regionalTemperatureLimitNegative: 0,
      negativeTemperature: false),
  Regional(
      regionalName: 'Forest',
      regionalDescription: 'Description for Item 3',
      effectRegionalName: ' ',
      effectRegionaldescription: ' ',
      effectRegional1: ' ',
      roller1: '1d1',
      effectRegional2: ' ',
      roller2: '1d1',
      effectRegional3: ' ',
      roller3: '1d1',
      effectRegional4: ' ',
      roller4: '1d1',
      effectRegional5: ' ',
      regionalTemperatureLimitPositive: 22,
      regionalTemperatureLimitNegative: 24,
      negativeTemperature: true),
  Regional(
      regionalName: 'Desert',
      regionalDescription: 'Description for Item 3',
      effectRegionalName: ' ',
      effectRegionaldescription: ' ',
      effectRegional1: ' ',
      roller1: '1d2',
      effectRegional2: ' ',
      roller2: '1d2',
      effectRegional3: ' ',
      roller3: '1d2',
      effectRegional4: ' ',
      roller4: '1d2',
      effectRegional5: ' ',
      regionalTemperatureLimitPositive: 54,
      regionalTemperatureLimitNegative: 10,
      negativeTemperature: true),
];

/*final List<Affliction> AfflictionList = [
  Affliction(Athrakitis)
  Affliction(Basidirond Spores)
      Affliction(Blightburn Sickness)
      Affliction(Blinding Sickness)
      Affliction(Blister Phage)
      Affliction(Bluespit)
      Affliction(Bog Rot)
      Affliction(Bonecrusher (Dengue) Fever)
  Affliction(Boot Soup)
      Affliction(Brainworms)
      Affliction(Bubonic Plague)
      Affliction(Cackle Fever)
  Affliction(Cholera)
  Affliction(Coward's Mark)
  Affliction(Demon Fever)
  Affliction(Devil Chills)
  Affliction(Dysentery)
      Affliction(Enteric Fever)
      Affliction(Filth Fever)
      Affliction(Final Rest)
  Affliction(Firegut)
  Affliction(Green Haze)
  Affliction(Greenscale)
      Affliction(Leprosy)
  Affliction(Malaria (Jungle Fever))
  Affliction(Mindfire)
      Affliction(Pulsing Puffs)
      Affliction(Rabies)
      Affliction(Rapture Pox)
      Affliction(Red Ache=
      Affliction(Red Drip=
      Affliction(Scarlet Leprosy)
      Affliction(Seasickness)
      Affliction(Shakes)
      Affliction(Shattermind)
      Affliction(Sleeping Sickness)
      Affliction(Slimy Doom)
      Affliction(Tetanus)
      Affliction(Tuberculosis)
      Affliction(Typhoid Fever)
      Affliction(Zombie Rot)
]*/

final List<Weather> weatherList = [
  Weather(
      weatherName: 'Drizzle',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Drought',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Thunderstorm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Snow',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Hail',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Cloudy',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Radiant-Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Umbral-Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
  Weather(
      weatherName: 'Phantasmal-Rain',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect'),
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

final roller = D20();

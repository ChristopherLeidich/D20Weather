import 'package:d20/d20.dart';

class Regional {
  final String regionalName;
  final String regionalDescription;
  final String effectRegionalName;
  final String effectRegionaldescription;
  final String effectRegional;

  final int regionalTemperatureLimitPositive;
  final double regionalTemperatureLimitNegative;
  final bool negativeTemperature;

  Regional(
      {required this.regionalName,
      required this.regionalDescription,
      required this.effectRegionalName,
      required this.effectRegionaldescription,
      required this.effectRegional,
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
  final double weatherTemperatureModifer;
  final int weatherWindspeed;

  Weather({

      required this.weatherName,
      required this.weatherDescription,
      required this.weatherEffectname,
      required this.weatherEffectdescription,
      required this.weatherEffect,
      required this.weatherTemperatureModifer,
      required this.weatherWindspeed,
  });
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
      effectRegional: 'Once every 1d6 [[1d6]] '
      'hour(s) every Non-Undead '
          'member of the party has to roll '
          'a basic DC15 Fortitude-Save or loose 1d2 [[1d2]] '
          'Hit-Points. On a critical failure the damage dice changes to 1d4 [[1d4]]'
          'and the party-member will get infected by a random disease based on the following 1d42 [[1d42]]'
          'more information on in-game diseases at: https://www.d20pfsrd.com/gamemastering/afflictions/diseases/diseases-paizo-inc/',
      regionalTemperatureLimitPositive: 48,
      regionalTemperatureLimitNegative: -0,
      negativeTemperature: false,
  ),
  Regional(
    regionalName: 'Glacier',
    regionalDescription: 'A cold barren wasteland of Ice and Snow. '
        'The cold temperatures do little in the way of hospitality. '
        'To an unprepared party traversing these icy planes means almost certain Death.',
    effectRegionalName: 'Deadly Frost',
    effectRegionaldescription: 'The cold is clinging onto your body, '
        'leaving you more susceptible to harm from all sources.',
    effectRegional:
        'For the duration of your stay every member of the party [[1d20]]'
        'who does not have at least [5] Cold-Resistance '
        'has to roll a basic DC [18] Fortitude Save every 1d4 [[1d4]] '
        'hour(s) or gain one level of enfeeblement and take 1d6 [[1d6]] '
        'cold damage.\nThis debuff lasts until the character takes a Long-Rest'
        ' in a warm location or until death.'
        '\nOn a critical failure they additionally gain a stack of the '
        'wounded condition and the damage dice changes to 1d8 [[1d8]] '
        'cold damage.\nparty members with at least cold resistance 5 have to '
        'roll for the following fortitude save instead after every 1d8 [[1d8]] '
        'hour(s) with the same effect on failure or critical failure.',
    regionalTemperatureLimitPositive: 3,
    regionalTemperatureLimitNegative: -48,
    negativeTemperature: true,
  ),
  Regional(
      regionalName: 'Ocean',
      regionalDescription: 'Oceans are a wellspring of life to many Lifeforms. '
          'However not all of them are always on good Terms with Human-Society. '
          'As a Famous Fisher from the Astral Coast Once Said: "The Ocean is beautiful and '
          'bountiful to those fools that don`t have to work with it every day..."',
      effectRegionalName: 'Strong Waves',
      effectRegionaldescription: ' When Traveling the Oceans Krakens and Giant Seasnakes are not the Only things to be weary about. Even the Waves are bigger here.',
      effectRegional: 'When in Battle at the Start of each turn every Party-member has to make a basic DC 14 Reflex Saver  or be knocked Prone und you become Clumsy 1 until the Start of your next Round. '
                      'A Successful Save makes you Immune to the effect of Strong Waves for the Next 1d4 [[1d4]] Hours.\n'
                      'On a Critical failure You Instead become Clumsy 3 until the Start you your next Round and become Disarmed.',
      regionalTemperatureLimitPositive: 44,
      regionalTemperatureLimitNegative: -4,
      negativeTemperature: true),
  Regional(
      regionalName: 'Beach',
      regionalDescription: 'Beaches are often not what the Common Man would picture of the word. Beaches can range from beautiful Glistening Beaches of Clear Water and Fine White Sand in Warm weathers to Literal Stormfronts of Raging Tides unhospitable to any who may think of exploring the area. In short You may never know for sure what you will encounter.',
      effectRegionalName: 'High and Low Tide',
      effectRegionaldescription: 'The Waning and Waxing of the Moon affects no Region as much as the Ocean. It is in a constant Mode of Change which makes survival in the long term an outright challenge.',
      effectRegional:  'Roll a Dice. If the Result is even it is currently High-Tide. On an odd result it is Low Tide [[1d4]] '
                        'High Tide: The Chance of encountering Creatures from the Sea is doubled and all Dice to determine the '
                        'Amount of Creatures from withing the Ocean is doubled as Well. If a random Encounter is a Sea-Creature roll 1d20 [[1d20]]'
                        'on an 18 or Higher one of The Creatures is an Elite Monster.\nLow Tide: The Chance of Encountering land-bound '
                        'or amphibious Creatures is doubled and all Dice to determine the Amount of Creatures from land-bound or amphibious'
                        ' Creatures is doubled as Well. If a random Encounter is not a Sea-Creature roll 1d20 [[1d20]]'
                        'on an 18 or Higher one of The Creatures is an Elite Monster. If the Encounter however is a Sea-Creature roll 1d4 [[1d4]].'
                        ' The Amount of Creatures Rolled is in a weakened State when Encountered',
      regionalTemperatureLimitPositive: 42,
      regionalTemperatureLimitNegative: -0,
      negativeTemperature: false),
  Regional(
      regionalName: 'Forest',
      regionalDescription:  'One of the Most Common Areas to come across in All the Realms. '
                            'Woods can either describe an Assortment of Trees or a wild Untamed Land of Dangers. '
                            'To this Day Most Adventurers meet their Untimely End in Forests Either by Starvation '
                            'due to misdirection or by one '
                            'of its countless Inhabitants.',
      effectRegionalName: 'Scrub and Foliage',
      effectRegionaldescription:  'Most Times the Adventurers Path leads into untamed Areas of the Woods. '
                                  'Not only are they More Dangerous in the Sense of Encountering more Wildlife '
                                  'but also in the Fauna itself. Under-bushes, Plants toxic to the Touch and '
                                  'brambles make the Traversal of such Areas an equally big Challenge as Deserts or Glaciers at Times.',
      effectRegional: 'When Traversing the Forest Roll 1d100 [[1d100]] on a Roll above 80 the Area ahead is covered in Brambles and Scrub. '
                      'Traversing such an Area counts as Difficult Terrain. Additionally on the First Movement-Action into such an Area '
                      'every Creature must make a DC15 Reflex Save.\n On a Failure They become Immobilised until the Start of their next '
                      'Turn and take 1d4 [[1d4]] precision Damage due to Thorns.\nOn a Critical Failure they Take 1d8 [[1d8]] precision Damage '
                      'and make a DC14 Fortitude-Save or become Poisoned 1. This Check has no further Critical Failure Condition.',
      regionalTemperatureLimitPositive: 22,
      regionalTemperatureLimitNegative: -24,
      negativeTemperature: true),
  Regional(
      regionalName: 'Desert',
      regionalDescription: 'Description for Item 3',
      effectRegionalName: ' ',
      effectRegionaldescription: ' ',
      effectRegional: ' ',
      regionalTemperatureLimitPositive: 54,
      regionalTemperatureLimitNegative: -10,
      negativeTemperature: true),
];


final List<Weather> weatherList = [
  Weather(
      weatherName: 'Drizzle',
      weatherDescription: 'Small Raindrops Form on your Skin. Sight for Sore Eyes in a hot environments but makes it so much harder to endure in cold Climates. ',
      weatherEffectname: 'Wet',
      weatherEffectdescription: 'The Longer you Stay outside the more drenched you will become. The Small Drops of water accumulate easily on you gear und will make you more Susceptible to Electricity and Coldness.',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -5,
      weatherWindspeed: 38
  ),
  Weather(
      weatherName: 'Drought',
      weatherDescription: 'There is not a single Drop of Water in Sight. the Air is unnaturally dry to the point it makes the Skin Brittle. '
                          'If no Water is Provided it is a clear Sign that you have not much longer to life if this continues.',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: 10,
      weatherWindspeed: 15
  ),
  Weather(
      weatherName: 'Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -10,
      weatherWindspeed: 120
  ),
  Weather(
      weatherName: 'Thunderstorm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -4,
      weatherWindspeed: 180
  ),
  Weather(
      weatherName: 'Snow',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -11,
      weatherWindspeed: 12
  ),
  Weather(
      weatherName: 'Hail',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -18,
      weatherWindspeed: 38
  ),
  Weather(
      weatherName: 'Cloudy',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -1,
      weatherWindspeed: 28
  ),
  Weather(
      weatherName: 'Radiant-Storm',
      weatherDescription: 'Small Particles of Light Start to fall from the Edges of the Antumbral Realms onto the Prime-Material-Realm an drench the World into a Soothing Light.',
      weatherEffectname: 'Positive Enhancement',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: 0,
      weatherWindspeed: 1
  ),
  Weather(
      weatherName: 'Umbral-Storm',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -25,
      weatherWindspeed: 190
  ),
  Weather(
      weatherName: 'Phantasmal-Rain',
      weatherDescription: '',
      weatherEffectname: 'weatherEffectname',
      weatherEffectdescription: 'weatherEffectdescription',
      weatherEffect: 'weatherEffect',
      weatherTemperatureModifer: -20,
      weatherWindspeed: 10
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


final roller = D20();

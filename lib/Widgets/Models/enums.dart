// enums.dart
import 'dart:math';
import 'dart:ui';

import 'package:fantasy_weather_app/Widgets/randomizer.dart';

enum Pictures {
  picture1,
  picture2,
  picture3,
  picture4,
  picture5,
  picture6,
}

extension PictureExtension on Pictures {
  String get assetPath {
    switch (randIndex) {
      case 1:
        return 'assets/images/Jungle(1080x600).png';
      case 2:
        return 'assets/images/Glacier(1080x600).png';
      case 3:
        return 'assets/images/Ocean(1080x600).png';
      case 4:
        return 'assets/images/Beach(1080x600).png';
      case 5:
        return 'assets/images/Forest(1080x600).png';
      case 6:
        return 'assets/images/Desert(1080x600).png';
      default:
        throw ArgumentError('Invalid picture');
    }
  }
}
/*
List<Picture> getRandomPictures() {
  const values = Picture.values;
  final random = Random();
  final randomPictures = <Picture>[];

  for (int i = 0; i < 3; i++) {
    randomPictures.add(values[random.nextInt(values.length)]);
  }

  return randomPictures;
}*/
// enums.dart
import 'dart:math';

enum Picture {
  picture1,
  picture2,
  picture3,
  picture4,
  picture5,
  picture6,
}

extension PictureExtension on Picture {
  String get assetPath {
    switch (this) {
      case Picture.picture1:
        return 'assets/images/glacier.jpg';
      case Picture.picture2:
        return 'assets/images/KT3A7OD.jpeg';
      case Picture.picture3:
        return 'assets/images/9502ac62b81f208465c7beb0d4338c77.jpg';
      case Picture.picture4:
        return 'assets/images/44.jpg';
      case Picture.picture5:
        return 'assets/images/1123010.jpg';
      case Picture.picture6:
        return 'assets/images/hcXuUBG_1.jpg';
      default:
        throw ArgumentError('Invalid picture');
    }
  }
}

List<Picture> getRandomPictures() {
  const values = Picture.values;
  final random = Random();
  final randomPictures = <Picture>[];

  for (int i = 0; i < 3; i++) {
    randomPictures.add(values[random.nextInt(values.length)]);
  }

  return randomPictures;
}
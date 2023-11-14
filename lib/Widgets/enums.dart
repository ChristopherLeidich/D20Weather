// enums.dart
import 'dart:math';

enum Picture {
  picture1,
  picture2,
  picture3,
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
      default:
        throw ArgumentError('Invalid picture');
    }
  }
}

Picture getRandomPicture() {
  const values = Picture.values;
  final random = Random();
  return values[random.nextInt(values.length)];
}
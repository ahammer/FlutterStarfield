import 'dart:math';
import 'dart:ui';

import 'package:vector_math/vector_math_64.dart';

final startTime = DateTime.now().millisecondsSinceEpoch;
class StarField {
  List<Star> stars = [];
  StarField(int starCount)  {
    for (int i=0; i<starCount;i++) {
      stars.add(new Star());
    }
  }
}

Random starRandom = Random.secure();
class Star {
  final position = Vector3(getNormalizedRandom(),getNormalizedRandom(),getNormalizedRandom());
  final alpha = starRandom.nextInt(128) + 128;
  final red = starRandom.nextInt(50) + 205;
  final green = starRandom.nextInt(50) + 205;
  final blue = starRandom.nextInt(50) + 205;
  final screenVector = Vector3.zero();
  var screenOffset = Offset.zero;

  static var standardDeviation = 0.5;
  static var mean = 0.5;

  double z=0;

  static double getNormalizedRandom() => starRandom.nextDouble();
}


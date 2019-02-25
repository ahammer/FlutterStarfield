import 'dart:math';

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
  final x = starRandom.nextDouble();
  final y = starRandom.nextDouble();
  final xs = pow(starRandom.nextDouble(),3) * 10;
  final alpha = starRandom.nextInt(128) + 128;
  final red = starRandom.nextInt(50) + 205;
  final green = starRandom.nextInt(50) + 205;
  final blue = starRandom.nextInt(50) + 205;

}


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mysassa/state/Constants.dart';

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
  final xs = starRandom.nextDouble() / 2.0 + 0.5;
  final alpha = starRandom.nextInt(128) + 128;
  final red = starRandom.nextInt(50) + 205;
  final green = starRandom.nextInt(50) + 205;
  final blue = starRandom.nextInt(50) + 205;

}
final startTime = DateTime.now().millisecondsSinceEpoch;

class StarLayoutDelegate extends MultiChildLayoutDelegate {
  final StarField starField;
  StarLayoutDelegate(this.starField);

  @override
  void performLayout(Size size) {

    starField.stars.forEach((s)  {

      double x = s.x + (s.xs * (DateTime.now().millisecondsSinceEpoch - startTime) / 5000.0);
      if (x > 1) {
        x = x - x.floor();
      }
      x = 1-x;

      positionChild(s, Offset(x * size.width,s.y * size.height));

    });
    starField.stars.forEach((s) => layoutChild(s, BoxConstraints.tight(Size(10,10))));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;
}

List<Widget> getStars(StarField sf) {
  return sf.stars.map((star) => LayoutId(id:star, child:Image.asset("assets/star.png", width: Constants.STAR_SIZE_W * star.xs, height: Constants.STAR_SIZE_H * star.xs,))).toList();
}


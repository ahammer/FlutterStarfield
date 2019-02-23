import 'dart:math';

import 'package:flutter/material.dart';

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
  final xs = starRandom.nextDouble();
}

class StarLayoutDelegate extends MultiChildLayoutDelegate {
  final StarField starField;
  StarLayoutDelegate(this.starField);

  @override
  void performLayout(Size size) {
    starField.stars.forEach((s) => positionChild(s, Offset(s.x * size.width,s.y * size.height)));
    starField.stars.forEach((s) => layoutChild(s, BoxConstraints.tight(Size(10,10))));

  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    return false;
  }

}

List<Widget> getStars(StarField sf) {
  return sf.stars.map((star) => LayoutId(id:star, child:Container(color:Colors.white, width: 10, height: 10,))).toList();
}


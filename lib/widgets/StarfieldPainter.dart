import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mysassa/state/StarField.dart';


class StarfieldPainter extends CustomPainter {
  final StarField starField;
  final double numStars;

  StarfieldPainter(this.starField, this.numStars);

  Paint starPaint = Paint();
  @override
  void paint(Canvas canvas, Size size) {


    starPaint.isAntiAlias = false;
    starField.stars.take(numStars.floor()).forEach((s) {
      double x = s.x + (s.xs * (DateTime
          .now()
          .millisecondsSinceEpoch - startTime) / 5000.0);
      if (x > 1) x -= x.floor();
      starPaint.color = Color.fromARGB(s.alpha,s.red,s.green,s.blue);

      Offset center = Offset(x * size.width, s.y * size.height);
      double height = 2 * s.xs;
      double length = 5 * s.xs;

      Rect starRect = Rect.fromPoints(center.translate(-length/2, -height/2),center.translate(length/2, height/2));
      canvas.drawRect(starRect, starPaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

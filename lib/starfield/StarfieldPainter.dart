import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mysassa/starfield/StarField.dart';


class StarFieldPainter extends CustomPainter {
  final StarField starField;
  final double numStars;

  StarFieldPainter(this.starField, this.numStars);

  Paint starPaint = Paint();
  final Gradient gradient = new RadialGradient(
    colors: <Color>[
      Colors.green.withOpacity(1.0),
      Colors.green.withOpacity(0.3),
      Colors.yellow.withOpacity(0.2),
      Colors.red.withOpacity(0.1),
      Colors.red.withOpacity(0.0),
    ],
    stops: [
      0.0,
      0.5,
      0.7,
      0.9,
      1.0,
    ],
  );


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
      double height = 1 + (s.xs / 5);
      double length = 2*s.xs;

      var topLeft = center.translate(-length/2, -height/2);
      var bottomRight = center.translate(length/2, height/2);


      Rect starRect = Rect.fromPoints(topLeft,bottomRight);
      canvas.drawRect(starRect, starPaint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

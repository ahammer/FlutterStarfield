import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mysassa/starfield/StarField.dart';
import 'package:vector_math/vector_math_64.dart';

class StarFieldPainter extends CustomPainter {
  final StarField starField;
  final double numStars;

  StarFieldPainter(this.starField, this.numStars);

  Paint starPaint = Paint()
    ..isAntiAlias = false
    ..color = Color.fromARGB(255, 255, 255, 255);


  Matrix4 perspective = Matrix4.identity()
    ..setEntry(3, 2, 0.0045); // perspective;

  static double offset = 0.5;
  static double scale = 2000;
  var localScale = Vector3(scale, scale, scale);
  var localOffset = Vector3(-offset, -offset, -offset);

  @override
  void paint(Canvas canvas, Size size) {
    var screenOffset = Vector3(size.width / 2, size.height / 2, 0);
    var time = (DateTime.now().millisecondsSinceEpoch) / 5000.0;
    var cameraPosition =
        Vector3(cos(time * 0.5) / 3, cos(time * 0.3) / 3, cos(time) / 3);

    var rx = cos(time/10)*20;
    var ry = cos((time+123)/15)*30;
    var rz = cos((time+453)/20)*40;


    Matrix4 camera = Matrix4.identity()
      ..rotateX(rx)
      ..rotateY(ry)
      ..rotateZ(rz);

    starField.stars
        .take(numStars.floor())
        .map((star) { //Transform each star
          Vector3 currentPoint = star.screenVector;
          currentPoint.setFrom(star.position);
          currentPoint.add(localOffset);
          currentPoint.add(cameraPosition);
          currentPoint.multiply(localScale);
          currentPoint.applyMatrix4(camera);
          currentPoint.applyProjection(perspective);
          currentPoint.add(screenOffset);
          return star;
        })
        .where((pos) =>     //Cull invisible stars
            pos.screenVector.z < 255 &&
            pos.screenVector.x > 0 &&
            pos.screenVector.x < size.width &&
            pos.screenVector.y > 0 &&
            pos.screenVector.y < size.height)
        .forEach((star) {     //Draw each star
          Offset center = Offset(star.screenVector.x, star.screenVector.y);
          double distance = 255 - star.screenVector.z;
          if (distance > 255) distance = 255;
          if (distance < 0) distance = 0;
          int color = distance.round();
          starPaint.color = Color.fromARGB(255, color, color, color);
          canvas.drawPoints(PointMode.points, [center], starPaint);
        });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

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
    ..setEntry(3, 2, 0.005); // perspective;

  static double offset = 0.5;
  static double scale = 2000;
  var localScale = Vector3(scale, scale, scale);
  var localOffset = Vector3(-offset, -offset, -offset);

  @override
  void paint(Canvas canvas, Size size) {
    var screenOffset = Vector3(size.width / 2, size.height / 2, 0);
    var time = (DateTime.now().millisecondsSinceEpoch) / 6000.0;
    var cameraPosition =
        Vector3(cos(time * 2)/5, cos(time * 3)/5, cos(time)/5);

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
        return star;
      })
          .where((pos) => pos.screenVector.z > -0)
          .map((star) {
            star.z = star.screenVector.z;
            star.screenVector.applyProjection(perspective);
            star.screenVector.add(screenOffset);
            star.screenOffset = Offset(star.screenVector.x, star.screenVector.y);
            return star;
          }).where((star)=>star.screenOffset.dx > 0 && star.screenOffset.dy > 0 && star.screenOffset.dx < size.width && star.screenOffset.dy < size.height)
    .forEach((star) {
        double maxDistance = 1200;
        double d = maxDistance-star.z;
        if (d>maxDistance) return;
        if (d<0) d = 0;
        d /= maxDistance;
        var c = (d * 255).round();
        starPaint.color = Color.fromARGB(255,c,c,c);
        canvas.drawPoints(PointMode.points, [star.screenOffset], starPaint);
      });



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

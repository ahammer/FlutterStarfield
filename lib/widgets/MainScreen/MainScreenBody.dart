import 'package:flutter/material.dart';
import 'package:flutter_mysassa/starfield/StarField.dart';
import 'package:flutter_mysassa/starfield/StarfieldPainter.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenBackground.dart';

Widget getBody(StarField starField, double numStars) => Stack(
    children: <Widget>[
      getBackground(),
      CustomPaint(
          painter: StarFieldPainter(starField, numStars),
          size: Size.infinite),
    ]);

import 'dart:math';

import 'package:flutter/material.dart';

getBackground() {
  double time = DateTime.now().millisecondsSinceEpoch / 300.0;
  double a = time / 34;
  double b = time / 31;
  double c = time / 39;

  double a2 = time / 3;
  double b2 = time / 7;
  double c2 = time / 1;

  int alpha = 255;
  int red = (cos(a + a2) * 50).floor() + 205;
  int green = (cos(b + b2) * 50).floor() + 205;
  int blue = (cos(c + c2) * 50).floor() + 205;
  Color color = Color.fromARGB(alpha, red, green, blue);

  return Transform.scale(
      scale: cos((a + b + c + a2 + b2 + c2) / 20.0) / 5.0 + 1.2,
      child: Image.asset("assets/space.jpg",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          color: color,
          colorBlendMode: BlendMode.multiply));
}

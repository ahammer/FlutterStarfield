import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mysassa/state/StarField.dart';
import 'package:flutter_mysassa/widgets/StarfieldPainter.dart';

class MainScream extends StatefulWidget {
  MainScream({Key key, this.title}) : super(key: key);
  final String title;

  
  @override
  _MainScreamState createState() => _MainScreamState();
}

class _MainScreamState extends State<MainScream> with SingleTickerProviderStateMixin {
  final StarField starField = StarField(20000);
  double numStars = 500;

  void changeSlideValue(double value) {
    numStars = value;
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(body:  Stack(
        children: <Widget>[
          getBackground(),
          CustomPaint(painter:StarfieldPainter(starField, numStars), size: Size.infinite),


        ],

      ),
        bottomSheet: Row(children: <Widget>[Flexible(
          flex: 1,
          child: Container(height: 40, color: Colors.transparent,
              child: Slider(value: numStars, min: 0, max:20000,onChanged: changeSlideValue))),
        Text(numStars.floor().toString())],mainAxisSize: MainAxisSize.max,),

    );
  }

  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1), vsync: this,
    )..repeat();
    _controller.addListener(_refresh);
  }

  void _refresh() {
    setState(() {});
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  getBackground() {
    double time = DateTime.now().millisecondsSinceEpoch / 300.0;
    double a = time / 34;
    double b = time / 31;
    double c = time / 39;

    double a2 = time / 3;
    double b2 = time / 7;
    double c2 = time / 1;

    int alpha = 255;
    int red = (cos(a+a2)*50).floor() + 205;
    int green = (cos(b+b2)*50).floor() + 205;
    int blue = (cos(c+c2)*50).floor() + 205;
    Color color = Color.fromARGB(alpha, red, green, blue);


    return  Transform.scale(scale: cos((a+b+c+a2+b2+c2)/20.0)/5.0 + 1.2, child:Image.asset("assets/space.jpg",fit: BoxFit.cover, height: double.infinity, width: double.infinity, color: color, colorBlendMode: BlendMode.multiply));
  }


}

class StarsAnimatedWidget extends CustomMultiChildLayout {
  final StarField starField;
  StarsAnimatedWidget(this.starField);
}

Widget sideNav() => Container(
    width: 200,
    padding: const EdgeInsets.all(8.0),
    color: Colors.cyanAccent,
    alignment: Alignment.topRight,
    child: Text('Hello World'),
  );
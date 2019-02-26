
import 'package:flutter/material.dart';
import 'package:flutter_mysassa/starfield/StarField.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreen.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenBody.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenFooter.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenInteractions.dart';


class MainScreenState extends State<MainScreen2> with SingleTickerProviderStateMixin implements MainScreenInteractions {
  final String title;
  final StarField starField = StarField(15000);
  double numStars = 100;
  AnimationController _controller;

  MainScreenState(this.title);

  @override
  void changeSlideValue(double value) {
    numStars = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: getBody(starField, numStars),
      bottomSheet: getFooter(),
    );
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1),
      vsync: this,
    )..repeat();
    _controller.addListener(_refresh);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _refresh() {
    setState(() {});
  }
}

class MainScreen2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
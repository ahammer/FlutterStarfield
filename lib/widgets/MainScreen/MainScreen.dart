import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mysassa/starfield/StarField.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenBody.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenFooter.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenState.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: getBody(),
      bottomSheet: getFooter(),
    );;
  }
}


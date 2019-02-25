import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenState.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MainScreenState createState() => MainScreenState(title);
}


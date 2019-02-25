import 'package:flutter/material.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenInteractions.dart';

Widget getFooter(double numStars, MainScreenInteractions callbacks) => Row(
  children: <Widget>[
    Flexible(
        flex: 1,
        child: Container(
            height: 40,
            color: Colors.transparent,
            child: Slider(
                value: numStars,
                min: 0,
                max: 8000,
                onChanged: callbacks.changeSlideValue))),
    Text(numStars.floor().toString())
  ],
  mainAxisSize: MainAxisSize.max,
);
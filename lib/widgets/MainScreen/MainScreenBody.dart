import 'package:flutter/material.dart';
import 'package:flutter_mysassa/starfield/StarField.dart';
import 'package:flutter_mysassa/starfield/StarfieldPainter.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenBackground.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenStore.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MainScreenViewModel {
  final double count;
  final StarField starField;
  MainScreenViewModel(this.count, this.starField);
}

Widget getBody() => StoreConnector<MainScreenStore, MainScreenViewModel>(
converter: (store) => MainScreenViewModel(store.state.stars, store.state.starField),
builder: (context, viewModel) =>
    Stack(children: <Widget>[
      getBackground(),
      CustomPaint(
          painter: StarFieldPainter(viewModel.starField, viewModel.count), size: Size.infinite),
    ]));

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

Widget getBody() => Stack(
    children: <Widget>[getBackground(), StarFieldContainingStatefulWidget()]);

class StarFieldContainingStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StarFieldState();
  }
}

class StarFieldState extends State<StarFieldContainingStatefulWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<MainScreenStore, MainScreenViewModel>(
        converter: (store) =>
            MainScreenViewModel(store.state.stars, store.state.starField),
        builder: (context, viewModel) =>
            AnimatedBuilder(animation: controller, builder:(_, child) => CustomPaint(
                painter: StarFieldPainter(viewModel.starField, viewModel.count), size: Size.infinite)));}

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(days: 1000), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

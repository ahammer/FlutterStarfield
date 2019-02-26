import 'package:flutter_mysassa/starfield/StarField.dart';

class MainScreenReduxState {
  final double stars;
  final StarField starField;
  MainScreenReduxState(this.stars, this.starField);
}

class ChangeStarCount {
  final double starCount;
  ChangeStarCount(this.starCount);
}

MainScreenReduxState reducer(MainScreenReduxState state, action) {
  if (action is ChangeStarCount) {
    return MainScreenReduxState(action.starCount, state.starField);
  }
  return state;
}
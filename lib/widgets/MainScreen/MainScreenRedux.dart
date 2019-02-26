import 'package:flutter_mysassa/starfield/StarField.dart';

class MainScreenStore {
  final double stars;
  final StarField starField;
  MainScreenStore(this.stars, this.starField);
}

class ChangeStarCount {
  final double starCount;
  ChangeStarCount(this.starCount);
}

MainScreenStore reducer(MainScreenStore state, action) {
  if (action is ChangeStarCount) {
    return MainScreenStore(action.starCount, state.starField);
  }
  return state;
}
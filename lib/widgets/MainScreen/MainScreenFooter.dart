import 'package:flutter/material.dart';

import 'package:flutter_mysassa/widgets/MainScreen/MainScreenStore.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

typedef setStarCount(double amount);

class FooterViewModel {
  final double count;
  final setStarCount;
  FooterViewModel(this.count, this.setStarCount);
}

Widget getFooter() => StoreConnector<MainScreenStore, FooterViewModel>(
    converter: (store) => FooterViewModel(store.state.stars, (progress) {
          store.dispatch(ChangeStarCount(progress));
        }),
    builder: (context, viewModel) => Row(
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                    height: 40,
                    color: Colors.transparent,
                    child: Slider(
                        value: viewModel.count,
                        min: 0,
                        max: 8000,
                        onChanged: (progress) {
                          viewModel.setStarCount(progress);
                        }))),
            Text(viewModel.count.floor().toString())
          ],
          mainAxisSize: MainAxisSize.max,
        ));

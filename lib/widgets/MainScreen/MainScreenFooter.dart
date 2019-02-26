import 'package:flutter/material.dart';

import 'package:flutter_mysassa/widgets/MainScreen/MainScreenRedux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

Widget getFooter() => StoreConnector<MainScreenReduxState, Store<MainScreenReduxState>>(
converter: (store) => store,
builder: (context, viewModel) => Row(
  children: <Widget>[
    Flexible(
        flex: 1,
        child: Container(
            height: 40,
            color: Colors.transparent,
            child: Slider(
                value: viewModel.state.stars,
                min: 0,
                max: 8000,
                onChanged: (progress){ viewModel.dispatch(ChangeStarCount(progress)); }
))),
    Text(viewModel.state.stars.floor().toString())
  ],
  mainAxisSize: MainAxisSize.max,
));
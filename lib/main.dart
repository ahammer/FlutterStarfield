import 'package:flutter/material.dart';
import 'package:flutter_mysassa/starfield/StarField.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreen.dart';
import 'package:flutter_mysassa/widgets/MainScreen/MainScreenStore.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final store = Store<MainScreenStore>(reducer, initialState: MainScreenStore(100, StarField(5000)));
    return StoreProvider<MainScreenStore>(
        store: store,
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: MainScreen(title: 'Space Simulation'))
    );
  }
}

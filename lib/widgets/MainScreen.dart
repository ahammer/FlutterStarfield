import 'package:flutter/material.dart';
import 'package:flutter_mysassa/state/StarField.dart';

class MainScream extends StatefulWidget {
  MainScream({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainScreamState createState() => _MainScreamState();
}

class _MainScreamState extends State<MainScream> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final StarField starField = StarField(100);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(color:Colors.red),
          StarsAnimatedWidget(starField),
        ],
      ),

      drawer: SideNav(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
class StarsAnimatedWidget extends AnimatedWidget {
  final StarField starField;

  StarsAnimatedWidget(this.starField);

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: StarLayoutDelegate(starField),
      children: getStars(starField),
    );
  }

}

Widget SideNav() {
  return Container(
    width: 200,
    padding: const EdgeInsets.all(8.0),
    color: Colors.cyanAccent,
    alignment: Alignment.topRight,
    child: Text('Hello World'),
  );
}
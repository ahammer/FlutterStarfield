import 'package:flutter/material.dart';
import 'package:flutter_mysassa/state/StarField.dart';

class MainScream extends StatefulWidget {
  MainScream({Key key, this.title}) : super(key: key);
  final String title;

  
  @override
  _MainScreamState createState() => _MainScreamState();
}

class _MainScreamState extends State<MainScream> with SingleTickerProviderStateMixin {
  final StarField starField = StarField(200);
  @override
  Widget build(BuildContext context) {

    return  Stack(
        children: <Widget>[
          Image.asset("assets/space.jpg", fit: BoxFit.cover, height: double.infinity, width: double.infinity),
          CustomMultiChildLayout(
            delegate: StarLayoutDelegate(starField),
            children: getStars(starField),
          ),
        ],
      );
  }

  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 10), vsync: this,
    )..repeat();
    _controller.addListener(_refresh);
  }

  void _refresh() {
    setState(() {});
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


}
class StarsAnimatedWidget extends CustomMultiChildLayout {
  final StarField starField;
  StarsAnimatedWidget(this.starField);
}

Widget sideNav() => Container(
    width: 200,
    padding: const EdgeInsets.all(8.0),
    color: Colors.cyanAccent,
    alignment: Alignment.topRight,
    child: Text('Hello World'),
  );
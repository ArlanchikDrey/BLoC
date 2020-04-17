import 'package:flutter/material.dart';

class GetUsers extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<GetUsers> with TickerProviderStateMixin{
  AnimationController _controller;
  CurvedAnimation _curve;

  String _response = "default";
  int _i = 0;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 2200), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInCirc);
    _controller.forward();
    super.initState();
  }

  void _updateText(){
    setState(() {
      _response = "click numbers: ${_i++}";
      _controller.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FadeTransition(
            opacity: _curve,
            child: FlutterLogo(size: 150.0)),
          Text(_response),
          FloatingActionButton(
            onPressed: _updateText,
            tooltip: 'Обновить текст',
            child: Icon(Icons.update),
          ),
        ]
      )
    );
  }

}
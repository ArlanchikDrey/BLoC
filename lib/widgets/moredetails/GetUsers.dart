import 'package:flutter/material.dart';

class GetUsers extends StatefulWidget{
  bool _isPageDetailSecond = false;

  GetUsers([bool isPageDetailSecond]){
    _isPageDetailSecond = isPageDetailSecond ?? false;
  }

  @override
  State<StatefulWidget> createState() {
    if(_isPageDetailSecond){
      return UserState(_isPageDetailSecond);
    }
    return UserState();
  }
}

class UserState extends State<GetUsers> with TickerProviderStateMixin{
  AnimationController _controller;
  CurvedAnimation _curve;

  String _response = "default";
  int _i = 0;

  bool _isPageDetailSecond = false;

  UserState([bool isPageDetailSecond]){
    _isPageDetailSecond = isPageDetailSecond ?? false;
  }

  @override
  void initState() {
    if(!_isPageDetailSecond){
      _controller = AnimationController(duration: const Duration(milliseconds: 2200), vsync: this);
      _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInCirc);
      _controller.forward();
    }
    super.initState();
  }

  void _updateText(){
    setState(() {
      _response = "click numbers: ${_i++}";
      if(!_isPageDetailSecond){
         _controller.reset();
      }
    });
  }

  Widget _getCurrentObject(){
    if(!_isPageDetailSecond)
      return FadeTransition(
            opacity: _curve,
            child: FlutterLogo(size: 150.0));
    else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _getCurrentObject(),
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
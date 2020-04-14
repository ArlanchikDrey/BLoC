import 'package:flutter/material.dart';

class GetUsers extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<GetUsers>{
  String _response = "default";
  int _i = 0;

  void _updateText(){
    setState(() {
      _response = "click numbers: ${_i++}";
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        children: [
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
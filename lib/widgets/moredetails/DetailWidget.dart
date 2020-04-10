import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget{
  void _close(BuildContext context){
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Details")
         ),
       body: RaisedButton(
         onPressed: () {_close(context);},
         child: Text("Назад"),
         ),
    );
  }

}
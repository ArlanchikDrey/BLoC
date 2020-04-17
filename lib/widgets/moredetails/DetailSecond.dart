import 'package:flutter/material.dart';

class DetailSecond extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Detail Second")
         ),
       body: Center(
         child: Column(
           children: <Widget>[
              RaisedButton(
                onPressed: () {Navigator.pop(context);},
                child: Text("Назад"),
              )
           ],
         )
       )
    );
  }

}
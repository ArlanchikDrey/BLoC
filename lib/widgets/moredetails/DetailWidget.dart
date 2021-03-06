import 'package:bloc_pattern/widgets/moredetails/GetUsers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget{
  String _counts;

  DetailWidget({String counts}): _counts = counts; 

  void _close(BuildContext context){
    Navigator.pop(context,_counts);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Detail $_counts")
         ),
       body: Center(
         child: Column(
           children: <Widget>[
              GetUsers(),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/third');  
                },
                child: Text("Открыть третье окно"),
                color: Colors.white,
                textColor: Colors.blue,
              ),
              RaisedButton(
                onPressed: () {_close(context);},
                child: Text("Назад"),
              )
           ],
         )
       )
    );
  }

}
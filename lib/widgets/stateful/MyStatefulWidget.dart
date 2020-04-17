import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget{

  MyWidgetState widgetState;

  int _getCount() => 0;

  int getCount() => widgetState.getCounts();

  String setCountsFromDetail(String countsFromDetail){
    widgetState.setCountsFromDetail(countsFromDetail);
  }
  
  @override
  State<StatefulWidget> createState() {
    widgetState = MyWidgetState(_getCount());
    return widgetState;
  }}

class MyWidgetState extends State<MyStatefulWidget>{
  int _count;
  String _countsFromDetail = "0";

  MyWidgetState(this._count);

  void countChange(){
    setState(() {
      _count++;
    });
  }

  String setCountsFromDetail(String countsFromDetail){
    this._countsFromDetail = countsFromDetail;
  }

  int getCounts() => _count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Counts: $_count $_countsFromDetail"),
        IconButton(
          icon: Icon(Icons.star,size: 35.0,color: Colors.blue,), 
          onPressed: countChange)
      ],
    );
  }

}
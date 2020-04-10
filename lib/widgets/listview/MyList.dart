import 'package:bloc_pattern/widgets/openurlwidget/BodyWidget.dart';
import 'package:flutter/material.dart';

class MyList extends StatelessWidget{
  List<Widget> _myList = [
      BodyWidget("Open site","Message One", messageTwo: "MessageTwo"),
      Divider(),
      BodyWidget("Open site","Message One", messageTwo: "MessageTwo"),
      Divider(),
      BodyWidget("Open site","Message One", messageTwo: "MessageTwo"),
      Divider(),
      BodyWidget("Open site","Message One", messageTwo: "MessageTwo")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _myList
    );
  }
}
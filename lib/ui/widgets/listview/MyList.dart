import 'package:bloc_pattern/ui/widgets/openurlwidget/BodyWidget.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Title")
      ),
      body: ListView(
        children: _myList
      )
    );
  }
}
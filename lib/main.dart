import 'package:bloc_pattern/widgets/openurlwidget/BodyWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    appBar: AppBar(
      title: Text("Title")
    ),
    body: BodyWidget("Open site","Message One", messageTwo: "MessageTwo")
  )
));


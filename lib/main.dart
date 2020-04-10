import 'package:bloc_pattern/widgets/listview/MyList.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    appBar: AppBar(
      title: Text("Title")
    ),
    body: MyList(),
  )
));


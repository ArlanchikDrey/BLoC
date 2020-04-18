import 'package:bloc_pattern/widgets/moredetails/MoreAboutPage.dart';
import 'package:flutter/material.dart';

class MoreAbout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoreAbout',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MoreAboutPage(),
    );
  }
}
import 'package:bloc_pattern/widgets/listview/MyList.dart';
import 'package:bloc_pattern/widgets/moredetails/DetailSecond.dart';
import 'package:bloc_pattern/widgets/moredetails/DetailWidget.dart';
import 'package:bloc_pattern/widgets/moredetails/MoreAbout.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (BuildContext context) => MyList(),
    '/second': (BuildContext context) => DetailWidget(),
    '/third': (BuildContext context) => DetailSecond(),
    '/fourth': (BuildContext context) => MoreAbout()
  },
  onGenerateRoute: (routeSettings) {
    var path = routeSettings.name.split('/');

    if(path[1] == 'second'){
      return MaterialPageRoute(
        builder: (context) => DetailWidget(counts:path[2]),
        settings: routeSettings);
    }
  },
));


import 'dart:async';
import 'package:bloc_pattern/widgets/listview/MyList.dart';
import 'package:bloc_pattern/widgets/moredetails/DetailSecond.dart';
import 'package:bloc_pattern/widgets/moredetails/DetailWidget.dart';
import 'package:bloc_pattern/widgets/moredetails/MoreAbout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'infinite_list_module/bloc/post_event.dart';
import 'infinite_list_module/bloc/simpleblocdelegate.dart';
import 'infinite_list_module/widgets/homepage.dart';
import 'timer_module/bloc/timer_bloc.dart';
import 'timer_module/ticker.dart';
import 'timer_module/widgets/timer.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_pattern/infinite_list_module/bloc/bloc.dart';

void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App()
  //MaterialApp(
  //  debugShowCheckedModeBanner: false,
  //  initialRoute: '/',
  //  routes: {
  //    '/': (BuildContext context) => MyList(),
  //    '/second': (BuildContext context) => DetailWidget(),
  //    '/third': (BuildContext context) => DetailSecond(),
  //    '/fourth': (BuildContext context) => MoreAbout()
  //  },
  //  onGenerateRoute: (routeSettings) {
  //    var path = routeSettings.name.split('/');
  //
  //    if(path[1] == 'second'){
  //      return MaterialPageRoute(
  //        builder: (context) => DetailWidget(counts:path[2]),
  //        settings: routeSettings);
  //    }
  //  },
  //)
);}

/*** class MyApp extends StatelessWidget{
  //@override
  //Widget build(BuildContext context) {
  //  return MaterialApp(
  //    debugShowCheckedModeBanner: false,
  //    theme: ThemeData(
  //      primaryColor: Color.fromRGBO(109, 234, 255, 1),
  //      accentColor: Color.fromRGBO(72, 74, 126, 1),
  //      brightness: Brightness.dark
  //    ),
  //    title: 'Wave Timer',
  //    home: BlocProvider(
  //      create: (context) => TimerBloc(ticker: Ticker()),
  //      child: Timer(),
  //    ),
  //  );
  }
}*/

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Infinite Scroll',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: BlocProvider(
          create: (context) =>
              PostBloc(httpClient: http.Client())..add(Fetch()),
          child: HomePage(),
        ),
      ),
    );
  }
}


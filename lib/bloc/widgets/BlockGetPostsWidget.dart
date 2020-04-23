import 'package:bloc_pattern/bloc/blocs/BusinessLogicComponent.dart';
import 'package:bloc_pattern/bloc/data/data_provider/DataProvider.dart';
import 'package:bloc_pattern/bloc/data/repository/Repository.dart';
import 'package:bloc_pattern/bloc/events/CounterEvent.dart';
import 'package:bloc_pattern/bloc/events/EventDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockGetPostsWidget extends StatelessWidget{
  BusinessLogicComponent _counterBloc = BusinessLogicComponent(Repository(DataProvider()));
  
  BlocBuilder _getBlocBuilder(BusinessLogicComponent counterBloc){
    return BlocBuilder<BusinessLogicComponent, String>(
        bloc: counterBloc,
        builder: (context, response) {
          return Center(
            child: Text(
              '$response',
              style: TextStyle(fontSize: 14.0),
            ),
          );
        },
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _getBlocBuilder(_counterBloc),
           FlatButton(
            onPressed: () {
              _counterBloc.add(EventDB.GET);
            },
            child: Text("Get Data"),
            color: Colors.black,
            textColor: Colors.white,
          ),
        ]
      )
    );
  }
}
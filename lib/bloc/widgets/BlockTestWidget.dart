import 'package:bloc_pattern/bloc/blocs/CounterBloc.dart';
import 'package:bloc_pattern/bloc/events/CounterEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockTestWidget extends StatelessWidget{
  CounterBloc _counterBloc = CounterBloc();

  BlocBuilder _getBlocBuilder(){
    return BlocBuilder<CounterBloc, int>(
        bloc: _counterBloc,
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
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
          _getBlocBuilder(),
          FlatButton(
            onPressed: () {
              _counterBloc.add(CounterEvent.INCREMENT);
            },
            child: Text("Increment"),
            color: Colors.black,
            textColor: Colors.white,
          ),
          FlatButton(
            onPressed: () {
              _counterBloc.add(CounterEvent.DECREMENT);
            },
            child: Text("Decrement"),
            color: Colors.black,
            textColor: Colors.white,
          )
        ]
      )
    );
  }
}

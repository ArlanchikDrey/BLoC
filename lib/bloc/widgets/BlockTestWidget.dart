import 'package:bloc_pattern/bloc/blocs/CounterBloc.dart';
import 'package:bloc_pattern/bloc/events/CounterEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockTestWidget extends StatelessWidget{
  CounterBloc _counterBlocNumber = CounterBloc();
  CounterBloc _counterBlocString = CounterBloc();

  BlocBuilder _getBlocBuilder({String countText, CounterBloc counterBloc}){
    var text = countText ?? '';
    return BlocBuilder<CounterBloc, int>(
        bloc: counterBloc,
        builder: (context, count) {
          return Center(
            child: Text(
              '$text$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      );
  }
  BlocBuilder _getBlocBuilderNumber(){
    return _getBlocBuilder(counterBloc: _counterBlocNumber);
  }
  BlocBuilder _getBlocBuilderString(){
    return _getBlocBuilder(countText: "your count = ",counterBloc: _counterBlocString);
  }

  Column _getButtons(CounterBloc counterBloc){
    return Column(
      children: <Widget>[
        FlatButton(
            onPressed: () {
              counterBloc.add(CounterEvent.INCREMENT);
            },
            child: Text("Increment"),
            color: Colors.black,
            textColor: Colors.white,
          ),
          FlatButton(
            onPressed: () {
              counterBloc.add(CounterEvent.DECREMENT);
            },
            child: Text("Decrement"),
            color: Colors.black,
            textColor: Colors.white,
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _getBlocBuilderNumber(),
          _getButtons(_counterBlocNumber),
          _getBlocBuilderString(),
          _getButtons(_counterBlocString)
        ]
      )
    );
  }
}

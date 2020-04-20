import 'package:flutter/material.dart';

class BlockTestWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BlockTestWidgetState();
  }
}

class BlockTestWidgetState extends State<BlockTestWidget>{

  int _i;

  @override
  void initState() {
    _i = 0;
    super.initState();
  }

  void _increment(){
    setState(() {
      _i++;
    });
  }

  void _decrement(){
    setState(() {
      if(_i >=0){
      _i--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("count $_i"),
          FlatButton(
            onPressed: () {
              _increment();
            },
            child: Text("Increment"),
            color: Colors.black,
            textColor: Colors.white,
          ),
          FlatButton(
            onPressed: () {
              _decrement();
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
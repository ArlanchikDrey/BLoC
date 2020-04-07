import 'package:flutter/material.dart';

void main() => runApp(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(child: MyStatelessWidget()),
      ),
    );

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello!');
  }
}

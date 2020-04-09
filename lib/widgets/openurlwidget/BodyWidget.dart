import 'package:bloc_pattern/widgets/stateful/MyStatefulWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyWidget extends StatelessWidget{
  String _btnName;
  final String _messageOne;
  String _messageTwo;
  BodyWidget(this._btnName, this._messageOne, {String messageTwo}){
      this._messageTwo = messageTwo;
  }

  void _openUrl(String url) async {
    if (await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not launch $url";
    }
  }

  String _setUrlPhoto(){
    return "https://avatars.mds.yandex.net/get-pdb/2018622/72a562de-8809-408e-ab4f-8454b250768c/s1200?webp=false";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        children: <Widget>[
          Image.network(
            _setUrlPhoto(), 
            width: 100.0, 
            height: 100.0,
            fit: BoxFit.cover
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text("This is my $_messageOne"),
                    Text("This is my $_messageTwo"),
                    FlatButton(
                      onPressed: () {
                        _openUrl("https://yandex.ru");
                      },
                      child: Text(_btnName),
                      color: Colors.red,
                      textColor: Colors.white,
                    )
                 ],
                )
              ),
          )),
          MyStatefulWidget()
        ],
      )
    );
  }

}
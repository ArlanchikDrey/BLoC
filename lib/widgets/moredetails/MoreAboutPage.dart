import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MoreAboutPage extends StatefulWidget{
  MoreAboutPage({Key key}) : super(key: key);

  @override
  _MoreAboutPageState createState() => _MoreAboutPageState();
}

class _MoreAboutPageState extends State<MoreAboutPage>{
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MoreAboutPage")
      ),
      body: getBody(),
    );
  }

  showLoadingDialog() => widgets.length == 0;

  getProgressDialog() => Center(child: CircularProgressIndicator()); 

  Widget getRow(int i) => Padding(padding: EdgeInsets.all(10.0), child: Text("Post ${widgets[i]}"));

  ListView getListView() => ListView.builder(
    itemCount: widgets.length,
    itemBuilder: (BuildContext context, int position){
      return getRow(position);
    });
  
  getBody(){
    if(showLoadingDialog()){
      return getProgressDialog();
    }else{
      return getListView();
    }
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}
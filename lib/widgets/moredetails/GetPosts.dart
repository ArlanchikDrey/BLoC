import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetPosts extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => GetPostsState();
}

class GetPostsState extends State<GetPosts>{
  
  String _respose = "empty";

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/users/1";
    http.Response response = await http.get(dataURL);
    setState(() {
      _respose = json.decode(response.body).toString();
    });
}

  @override
  Widget build(BuildContext context) {
    return Text(_respose);
  }

}
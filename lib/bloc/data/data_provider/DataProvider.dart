import 'dart:convert';
import 'package:http/http.dart' as http;

class DataProvider {
    Future<dynamic> readData(int num) async {
        String dataURL = "https://jsonplaceholder.typicode.com/users/${num}";
        http.Response response = await http.get(dataURL);
        
        return json.decode(response.body).toString();
    }
}
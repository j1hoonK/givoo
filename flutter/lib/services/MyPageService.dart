import 'dart:convert';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:http/http.dart' as http;

class MyOrgService {

  Future<List<MyOrgList>> fetchTodo() async {
    try {
      var response = await http.get(Uri.parse("http://10.0.2.2:1000/mypage/org/1"));
      print(response.statusCode);
      List<dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      List<MyOrgList> _result =
      _data.map((e) => MyOrgList.fromJson(e)).toList();
      print(_result[0].orgType);
      return _result;
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }
}

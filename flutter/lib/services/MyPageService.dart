import 'dart:convert';
import 'package:givoo/config/url.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:http/http.dart' as http;

class MyOrgService {

  // 내 단체 확인
  Future<List<MyOrgList>> fetchTodo() async {
    try {
      var response = await http.get(Uri.parse("http://${Url.url}:1000/mypage/org/1"));
      print(response.statusCode);
      List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      List<MyOrgList> result = data.map((e) => MyOrgList.fromJson(e)).toList();
      print(result[0].orgType);
      return result;
    } catch (error) {
      print('error == $error');
      throw Exception('Failed to load todo');
    }
  }
}

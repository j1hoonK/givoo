import 'dart:convert';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:http/http.dart' as http;

import '../config/custom_url.dart';

class MyOrgService {

  // 내 단체 확인
  Future<List<MyOrgList>> fetchTodo(userId) async {
    try {
      var response = await http.get(Uri.parse("${CustomUrl.url}/mypage/org/$userId"));
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

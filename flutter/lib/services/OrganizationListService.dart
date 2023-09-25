import 'dart:convert';
import 'dart:ffi';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:http/http.dart' as http;

class OrganizationListService {

  // 기관 정보 조회
  Future<List<Organization>> fetchTodo() async {
    try {
      var response = await http.get(Uri.parse("http://localhost:1000/org"));
      print(response.statusCode);
      List<dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      List<Organization> _result =
      _data.map((e) => Organization.fromJson(e)).toList();
      return _result;
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }
  Future<Map<String, dynamic>> fetchOrgInfo(orgId,userId) async {
    try {
      var response = await http.get(Uri.parse("http://10.0.2.2:1000/info/${orgId}/${userId}"));
      print(response.statusCode);
      Map<String,dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      return _data;
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }

  Future<List<Organization>> randomOrg() async {
    try {
      var response = await http.get(Uri.parse("http://10.0.2.2:1000/mainpage"));
      print(response.statusCode);
      List<dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      print("_data : ${_data}");
      List<Organization> _result =
      _data.map((e) => Organization.fromJson(e)).toList();

      return _result;
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }
  Future<void> fetchLike(orgId,userId) async {

    try {
      final data = {
        'orgId': orgId,
        'userId': userId, // 좋아요를 등록한 사용자 ID
      };
      final jsonData = jsonEncode(data);
      var response = await http.post(
          Uri.parse("http://10.0.2.2:1000/mypage/fav/apply"),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
          body:jsonData,
      );
      print(response.statusCode);
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }

  Future<void> fetchLikeToggle(favId) async {
    try {
      var response = await http.get(Uri.parse("http://10.0.2.2:1000/mypage/fav/${favId}"));
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }
}

import 'dart:convert';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:givoo/component/model/OrgImageModel.dart';
import 'package:http/http.dart' as http;

import '../config/custom_url.dart';

class OrganizationListService {

  // 기관 정보 조회
  Future<List<Organization>> fetchTodo() async {
    try {
      var response = await http.get(Uri.parse("${CustomUrl.url}/org"));
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
      print("orgId: $orgId userId : ${userId}");
      var response = await http.get(Uri.parse("${CustomUrl.url}/info/${orgId}/${userId}"));
      print(response.statusCode);
      Map<String,dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      return _data;
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }

  Future<List<Organization>> randomOrg() async {
    try {
      var response = await http.get(Uri.parse("${CustomUrl.url}/mainpage"));
      print('(OrganizationListService.dart)randomOrg response == ${response.statusCode}');
      List<dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      List<Organization> _result =
      _data.map((e) => Organization.fromJson(e)).toList();

      return _result;
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }
  Future<List<OrgImage>> orgImage(id) async {
    try {
      var response = await http.get(Uri.parse("${CustomUrl.url}/org/images/${id}"));
      print('(OrganizationListService.dart)randomOrg response == ${response.statusCode}');
      List<dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      List<OrgImage> _result =
      _data.map((e) => OrgImage.fromJson(e)).toList();
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
          Uri.parse("${CustomUrl.url}/mypage/fav/apply"),
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
      var response = await http.get(Uri.parse("${CustomUrl.url}/mypage/fav/${favId}"));
    } catch (error) {
      throw Exception('Failed to load todo');
    }
  }

  Future<List<OrgImage>> allImage()async{
    try{
      var response = await http.get(Uri.parse("${CustomUrl.url}/org/images/all"));
      List<dynamic> _data = json.decode(utf8.decode(response.bodyBytes));
      List<OrgImage> _result = _data.map((e) => OrgImage.fromJson(e)).toList();
      return _result;
    } catch (error) {
      throw Exception('Failed to load todo');
    }
    }
}

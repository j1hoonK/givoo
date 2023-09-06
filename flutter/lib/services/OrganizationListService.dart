import 'dart:convert';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:http/http.dart' as http;

class OrganizationListService {

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
}

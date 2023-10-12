import 'dart:convert';

import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:http/http.dart' as http;

import '../config/custom_url.dart';

class RecommendMoreService{
  Future<List<Organization>> fetchApi(orgType) async{
    try{
      var response = await http.get(Uri.parse("${CustomUrl.url}/info/orgtype/${orgType}"));
      List<dynamic> _data =json.decode(utf8.decode(response.bodyBytes));
      List<Organization> _result = _data.map((e) => Organization.fromJson(e)).toList();
      return _result;
    }catch(error){
      print("(RecommendMoreService): $error");
      throw Exception("Failed to load orgtype");
    }
  }
}

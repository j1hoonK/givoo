import 'dart:convert';

import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:http/http.dart' as http;

class RecommendMoreService{
  Future<List<Organization>> fetchApi(orgType) async{
    try{
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      var response = await http.get(Uri.parse("http://10.0.2.2:1000/info/orgtype/${orgType}"));
      List<dynamic> _data =json.decode(utf8.decode(response.bodyBytes));
      List<Organization> _result = _data.map((e) => Organization.fromJson(e)).toList();
      return _result;
    }catch(error){
      print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      throw Exception("Failed to load orgtype");
    }
  }
}

import 'dart:convert';

import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:givoo/config/url.dart';
import 'package:http/http.dart' as http;

class SearchService{
  Future<List<Organization>> fetchApi(String searchValue) async{
    try{
      var response = await http.get(Uri.parse("http://${Url.url}:1000/search/${searchValue}"));
      List<dynamic> _data =json.decode(utf8.decode(response.bodyBytes));
      List<Organization> _result = _data.map((e) => Organization.fromJson(e)).toList();
      return _result;
    }catch(error){
      throw Exception("Failed to load orgtype");
    }
  }
}
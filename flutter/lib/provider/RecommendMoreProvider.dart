import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:givoo/services/RecommendMoreService.dart';
class RecommendMoreProvider extends ChangeNotifier{

  List<Organization> _orgList =[];
  final RecommendMoreService _recommendMoreService = RecommendMoreService();
  List<Organization> get orgList =>_orgList;

  Future<void> fetchApi(orgType) async{
    List<Organization>? _data = await _recommendMoreService.fetchApi(orgType);
    _orgList = _data;
    notifyListeners();
  }


}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:givoo/component/model/OrgImageModel.dart';
import 'package:givoo/services/OrganizationListService.dart';
import 'package:givoo/services/RecommendMoreService.dart';
class RecommendMoreProvider extends ChangeNotifier{
  final OrganizationListService _OrganizationListService =
  OrganizationListService();

  Map<int, String> _orgImageMap = {};
  get orgImageMap => _orgImageMap;
  List<dynamic> _orgId=[];
  get orgId =>_orgId;
  List<String> _orgImageList=[];
  get orgImageList=>_orgImageList;
  List<Organization> _orgList =[];
  final RecommendMoreService _recommendMoreService = RecommendMoreService();
  List<Organization> get orgList =>_orgList;

  Future<void> fetchApi(orgType) async{
    _orgImageMap={};
    _orgImageList=[];
    List<Organization>? _data = await _recommendMoreService.fetchApi(orgType);
    List<OrgImage> _data2= await _OrganizationListService.allImage();
    _orgList = _data;
    for (OrgImage orgImage in _data2) {
      _orgImageMap[orgImage.orgId] = orgImage.savePath;
    }
    notifyListeners();
  }


}
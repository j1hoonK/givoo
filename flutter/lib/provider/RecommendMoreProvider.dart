import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:givoo/component/model/OrgImageModel.dart';
import 'package:givoo/services/OrganizationListService.dart';
import 'package:givoo/services/RecommendMoreService.dart';
class RecommendMoreProvider extends ChangeNotifier{
  final OrganizationListService _OrganizationListService =
  OrganizationListService();
  List<String> _orgImageList=[];
  get orgImageList=>_orgImageList;
  List<Organization> _orgList =[];
  final RecommendMoreService _recommendMoreService = RecommendMoreService();
  List<Organization> get orgList =>_orgList;

  Future<void> fetchApi(orgType) async{
    _orgImageList=[];
    List<Organization>? _data = await _recommendMoreService.fetchApi(orgType);
    _orgList = _data;
    await Future.forEach(_orgList,(img)async{
      List<OrgImage>? _data = await _OrganizationListService.orgImage(img.orgId);
      if (_data.isNotEmpty) {
        _orgImageList.add(_data[0].savePath);
      } else {
        _orgImageList.add("");
      }
    });
    notifyListeners();
  }


}
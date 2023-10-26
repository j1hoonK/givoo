import 'package:flutter/material.dart';
import 'package:givoo/component/model/OrgImageModel.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:givoo/pages/mypage/model/Notice.dart';
import 'package:givoo/services/MyPageService.dart';
import 'package:givoo/services/OrganizationListService.dart';


class MyPageProvider extends ChangeNotifier {
  List<dynamic> _noticeList =[];
  get noticeList=>_noticeList;
  Map<int, String> _orgImageMap = {};
  get orgImageMap=>_orgImageMap;
  final OrganizationListService _organizationListService =
  OrganizationListService();
  List<MyOrgList> _myOrgList= [];
  final MyOrgService _myOrgService  = MyOrgService();
  List<MyOrgList> get myOrgList =>_myOrgList;

  List<List<MyOrgList>> _myOrgList2=[];
  get myOrgList2=>_myOrgList2;
  late List<String> _orgTypes =[];
  List<String> get orgTypes =>_orgTypes;

  // 내 단체 확인
  Future<void> fetchTodo(userId) async {
    _myOrgList2=[];
    _orgImageMap={};
    List<MyOrgList>? data = await _myOrgService.fetchTodo(userId);
    List<OrgImage> _data2= await _organizationListService.allImage();
    _myOrgList = data;
    _orgTypes =  _myOrgList.map((org) => org.orgType).toList().toSet().toList();
    orgTypes.forEach((orgType) {
      var myOrg2 = _myOrgList.where((org)=>org.orgType==orgType).toList();
      _myOrgList2.add(myOrg2);
      print(_myOrgList2);
    });
    for (OrgImage orgImage in _data2) {
      _orgImageMap[orgImage.orgId] = orgImage.savePath;
    }
    notifyListeners();
  }

  Future<void> noticeListShow() async {
    List<dynamic>? data = await _myOrgService.showNotice();
    _noticeList = data;

    notifyListeners();
  }

  void toggleIsExpanded(idx){
    _noticeList[idx].isExpanded=!_noticeList[idx].isExpanded;
    notifyListeners();
  }


}


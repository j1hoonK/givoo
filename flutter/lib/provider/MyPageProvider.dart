import 'package:flutter/material.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:givoo/services/MyPageService.dart';


class MyPageProvider extends ChangeNotifier {

  List<MyOrgList> _myOrgList= [];
  final MyOrgService _myOrgService  = MyOrgService();
  List<MyOrgList> get myOrgList =>_myOrgList;
  List<List<MyOrgList>> myOrgList2=[];
  late List<String> _orgTypes =[];
  List<String> get orgTypes =>_orgTypes;
  // 내 단체 확인
  Future<void> fetchTodo() async {
    List<MyOrgList>? data = await _myOrgService.fetchTodo();
    _myOrgList = data;
    _orgTypes =  _myOrgList.map((org) => org.orgType).toList().toSet().toList();

    orgTypes.forEach((orgType) {
      var myOrg2 = _myOrgList.where((org)=>org.orgType==orgType).toList();
      myOrgList2.add(myOrg2);
    });
    notifyListeners();
  }
}


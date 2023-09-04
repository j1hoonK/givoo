import 'package:flutter/foundation.dart';
import 'package:givoo/component/gridView.dart';
import 'package:givoo/services/OrganizationListService.dart';

class MyPageProvider extends ChangeNotifier {

  List<Organization> _OrgList= [];
  final OrganizationListService _OrganizationListService  = OrganizationListService();
  List<Organization> get OrgList =>_OrgList;


  Future<void> fetchTodo() async {
    List<Organization>? _data = await _OrganizationListService.fetchTodo();
    _OrgList = _data;

    notifyListeners();
  }
}

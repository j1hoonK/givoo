import 'package:flutter/cupertino.dart';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:givoo/services/OrganizationListService.dart';
import 'package:givoo/services/SearchService.dart';

class OrganizationProvider extends ChangeNotifier {
  final OrganizationListService _OrganizationListService =
      OrganizationListService();
  final SearchService _searchService = SearchService();
  List<Organization> _OrgList = [];
  List<Organization> get OrgList => _OrgList;
  var _controller = TextEditingController();
  bool _isClearButtonVisible = false;
  bool _isSearchIconVisible = true;
  var _searchValue = "";
  get controller => _controller;
  bool get isClearButtonVisible => _isClearButtonVisible;
  bool get isSearchIconVisible => _isSearchIconVisible;
  get searchValue => _searchValue;
  List<Organization> _randomOrgList=[];
  Map<String,dynamic> _orgInfodata ={};
  Map<String,dynamic> get orgInfodata =>_orgInfodata;
  get randomOrgList=>_randomOrgList;
  late int _isFollowSelected;
  int get isFollowSelected=> _isFollowSelected;

  // 기관 정보 조회
  Future<void> fetchTodo() async {
    List<Organization>? _data = await _OrganizationListService.fetchTodo();
    _OrgList = _data;
    notifyListeners();
  }

  Future<void> searchOrg(String searchValue) async {
    List<Organization>? _data = await _searchService.fetchApi(searchValue);
    _OrgList = _data;
    notifyListeners();
  }

  void listener(value) {
    _searchValue = value;
    if (value == "") {
      _isClearButtonVisible = false;
      _isSearchIconVisible = true;
    } else {
      _isClearButtonVisible = true;
      _isSearchIconVisible = false;
    }
    notifyListeners();
  }

  void clear() {
    _controller.clear();
    notifyListeners();
  }

  Future<void> orgInfo(orgId,userId) async {
    Map<String,dynamic>? _data = await _OrganizationListService.fetchOrgInfo(orgId, userId);
    _orgInfodata = _data;
    _isFollowSelected =_orgInfodata['favFlag'];
    notifyListeners();
  }

  Future<void> randomOrg()async{
    List<Organization>? _data = await _OrganizationListService.randomOrg();
    _randomOrgList =_data;
    notifyListeners();
  }
  Future<void> likeIsert(orgId,userId)async{
    await _OrganizationListService.fetchLike(orgId,userId);
    notifyListeners();
  }
  Future<void> likeToggle(favId)async{
    await _OrganizationListService.fetchLikeToggle(favId);
    _isFollowSelected == 0 ? _isFollowSelected = 1 : _isFollowSelected = 0 ;
    notifyListeners();
  }

}

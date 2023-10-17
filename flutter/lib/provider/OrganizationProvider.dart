import 'package:flutter/cupertino.dart';
import 'package:givoo/component/model/OrgBoxModel.dart';
import 'package:givoo/component/model/OrgImageModel.dart';
import 'package:givoo/services/OrganizationListService.dart';
import 'package:givoo/services/SearchService.dart';

class OrganizationProvider extends ChangeNotifier {
  final OrganizationListService _OrganizationListService =
      OrganizationListService();
  final SearchService _searchService = SearchService();
  List<Organization> _OrgList = [];
  List<String> _orgImageList=[];
  get orgImageList=>_orgImageList;
  List<Organization> get OrgList => _OrgList;
  var _controller = TextEditingController();
  bool _isClearButtonVisible = false;
  bool _isSearchIconVisible = true;
  var _searchValue = "";
  List<String> _imagePath=[];
  get imagePath => _imagePath;
  get controller => _controller;

  bool get isClearButtonVisible => _isClearButtonVisible;

  bool get isSearchIconVisible => _isSearchIconVisible;

  get searchValue => _searchValue;
  List<Organization> _randomOrgList = [];
  Map<String, dynamic> _orgInfodata = {};

  Map<String, dynamic> get orgInfodata => _orgInfodata;

  get randomOrgList => _randomOrgList;
  int _isFollowSelected = 0;

  int get isFollowSelected => _isFollowSelected;

  // 기관 정보 조회
  Future<void> fetchTodo() async {
    List<Organization>? _data = await _OrganizationListService.fetchTodo();
    _OrgList = _data;
    notifyListeners();
  }

  Future<void> searchOrg(String searchValue) async {
    _orgImageList = [];
    List<Organization>? _data = await _searchService.fetchApi(searchValue);
    _OrgList = _data;
    await Future.forEach(_OrgList, (org) async {
      List<OrgImage>? _data = await _OrganizationListService.orgImage(
          org.orgId);
      if (_data.isNotEmpty) {
        _orgImageList.add(_data[0].savePath);
      } else {
        _orgImageList.add("");
      }
    });
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

  Future<void> orgInfo(orgId, int userId) async {
    _imagePath=[];
    Map<String, dynamic>? _data = await _OrganizationListService.fetchOrgInfo(orgId, userId);
    List<OrgImage>? _data2 = await _OrganizationListService.orgImage(orgId);
    // print("orgId:${_data2[0].savePath}");
    _orgInfodata = _data;
    _isFollowSelected = _orgInfodata['favFlag'];
    _data2.forEach((data) {
     _imagePath.add(data.savePath);
    });
    notifyListeners();
  }

  Future<void> randomOrg() async {
    _orgImageList = [];
    List<Organization>? _data = await _OrganizationListService.randomOrg();
    _randomOrgList = _data;
    // 비동기로 작업을 수행하며 모두 완료될 때까지 기다립니다.
    await Future.forEach(_randomOrgList, (ran) async {
      List<OrgImage>? _data = await _OrganizationListService.orgImage(
          ran.orgId);
      if (_data.isNotEmpty) {
        _orgImageList.add(_data[0].savePath);
      } else {
        _orgImageList.add("");
      }
    });
    notifyListeners();
  }
  Future<void> likeIsert(orgId, userId) async {
    await _OrganizationListService.fetchLike(orgId, userId);
    orgInfo(orgId, userId);
    print("likeInsert");
    notifyListeners();
  }

  Future<void> likeToggle(favId) async {
    await _OrganizationListService.fetchLikeToggle(favId);
    _isFollowSelected == 0 ? _isFollowSelected = 1 : _isFollowSelected = 0;
    print("likeToggle");
    notifyListeners();
  }

}

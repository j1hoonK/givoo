import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/mypage/model/Inquiry.dart';
import 'package:givoo/services/InquiryService.dart';

class InquiryProvider with ChangeNotifier {
  final InquiryService _inquiryService = InquiryService();
  String title = '';
  String content = '';
  int _currentIndex = 0;
  final _formKey = GlobalKey<FormState>();
  List<Inquiry> _inquiryList=[];
  get inquiryList=>_inquiryList;
  get formKey => _formKey;

  // 생성자
  // 페이지 소멸 시 TabController 해제

  void updateTitle(String newTitle) {
    title = newTitle;
    notifyListeners();
  }

  void updateContent(String newContent) {
    content = newContent;
    notifyListeners();
  }

  Future<void> sendInquiry(title, content,userId) async {
    await _inquiryService.sendInquiry(title, content, userId);
  }

  Future<void> loadInquiry() async{
    List<Inquiry> _data = await _inquiryService.loadInquiry(LoginViewModel.userId);
    print("_data: ${_data[0].status}");
    print(LoginViewModel.userId);
    _inquiryList=_data;
    notifyListeners();
  }
}
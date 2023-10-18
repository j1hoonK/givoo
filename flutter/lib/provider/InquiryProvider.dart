import 'package:flutter/material.dart';

class InquiryProvider with ChangeNotifier {
  String title = '';
  String content = '';
  int _currentIndex = 0;

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

  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
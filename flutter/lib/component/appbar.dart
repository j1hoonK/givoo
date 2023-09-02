import 'package:flutter/material.dart';

Widget Appbar(String title){
  return AppBar(
    centerTitle: true,     // 타이틀 중앙 정렬
    elevation: 0.0,        // 앱바 하단 그림자 없애기
    title: Text(title,
      style: TextStyle(color: Colors.black), ),
    backgroundColor: Colors.white,
  );
}
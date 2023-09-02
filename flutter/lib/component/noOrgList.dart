import 'package:flutter/material.dart';

Widget noOrgList(){
  return Center(
    child: Column(
      children: [
        Container(
           decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/person.png'),
  ),
  ),
        ),
        Text("현재 등록한 내 단체가 없습니다."),
        Text("등록하러가기",style: TextStyle(color: Colors.red),)
      ],
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:givoo/config/palette.dart';

Widget noOrgList() {
  return Center(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 60),
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/person.png'),
            ),
          ),
        ),
        Text("현재 등록한 내 단체가 없습니다.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 15),
        TextButton(
          child: Text(
            "등록하러가기",
            style: TextStyle(color: Palette.mainColor),
          ),
          onPressed: (){
          },
        )
      ],
    ),
  );
}

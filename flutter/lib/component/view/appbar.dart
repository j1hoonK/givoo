import 'package:flutter/material.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true, // 타이틀 중앙 정렬
      elevation: 0.0, // 앱바 하단 그림자 없애기
      title: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Image.asset('images/login/logo.png', height: MediaQuery
              .of(context)
              .size
              .height * 0.05)),
      backgroundColor: Colors.white,
      /*Text(
        title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),*/
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // ✅
}

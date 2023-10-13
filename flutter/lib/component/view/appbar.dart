import 'package:flutter/material.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  BaseAppbar({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true, // 타이틀 중앙 정렬
      elevation: 0.0, // 앱바 하단 그림자 없애기
      title: title!=null ? Text(title!,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
          :Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
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

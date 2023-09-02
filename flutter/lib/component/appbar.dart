import 'package:flutter/material.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget{
   BaseAppbar({super.key,
    required this.title});
   String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,     // 타이틀 중앙 정렬
      elevation: 0.0,        // 앱바 하단 그림자 없애기
      title: Text(title,
        style: TextStyle(color: Colors.black), ),
      backgroundColor: Colors.white,
    );
  }
   @override
   Size get preferredSize => Size.fromHeight(kToolbarHeight); // ✅
}



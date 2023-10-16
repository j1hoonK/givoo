import 'package:flutter/material.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppbar({Key? key});

  @override
  Widget build(BuildContext context) {
    var tHeight = MediaQuery.of(context).size.height;
    return AppBar(
      // automaticallyImplyLeading: false,
      toolbarHeight: double.infinity,
      centerTitle: true,
      elevation: 0,
      title: Container(
        margin: EdgeInsets.fromLTRB(0, tHeight *0.01 , 0 , 0),
        child: Image.asset(
          'images/login/logo.png',
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MediaQueryData.fromView(WidgetsBinding.instance!.window).padding.top + kToolbarHeight);
}
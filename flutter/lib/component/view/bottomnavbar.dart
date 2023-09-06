import 'package:flutter/material.dart';

import '../../pages/mainpage/view/mainpage.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key, required this.currentIndex});
  final int currentIndex;



  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  late final int currentIndex;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //바텀 네비게이터
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
          if(index == 0){
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => MainPage()),(route) => false);
          }if(index == 1){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()),(route) => false);
          }if(index == 2){
            Navigator.pushNamedAndRemoveUntil(context, '/MyPage',arguments: 10, (route) => false);
        }});
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.real_estate_agent),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '마이페이지',
        ),
      ],
    );
  }
}

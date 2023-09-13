import 'package:flutter/material.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/recommend/view/recommend.dart';

import '../../pages/mainpage/view/mainpage.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        //indicatorColor: Color(),
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) => setState(() {
          _currentIndex = value;
        }),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.manage_search),
            label: '검색',
          ),
          NavigationDestination(
            icon: Icon(Icons.real_estate_agent),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
        animationDuration: Duration(milliseconds: 1000),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          LogIn(),
          MainPage(),
          //Recommend()
          MyPage()
        ],
      ),

    );
  }
}

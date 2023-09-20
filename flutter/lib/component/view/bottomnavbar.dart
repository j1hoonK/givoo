import 'package:flutter/material.dart';
import 'package:givoo/pages/mainpage/view/mainPage2.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/search/view/search2.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:provider/provider.dart';
import '../../pages/mainpage/view/main_page.dart';
import '../../pages/search/view/search.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _currentIndex = 1;
  @override
  void initState(){
    super.initState();
    Provider.of<OrganizationProvider>(context, listen: false).randomOrg();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        //indicatorColor: Color(),
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) => setState(() {
          _currentIndex = value;
          if(value==1){
            Provider.of<OrganizationProvider>(context, listen: false).randomOrg();
          }
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
          Search(),
          MainPage2(),
          MyPage(),
        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/mainpage/view/main_page.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/search/view/search.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

import '../../config/back_key.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    Provider.of<LoginViewModel>(context, listen: false).checkUserId();
    Provider.of<OrganizationProvider>(context, listen: false).randomOrg();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.redAccent,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            if (value == 1) {
              Provider.of<OrganizationProvider>(context, listen: false)
                  .randomOrg();
            }
            if (value == 2) {
              if (Provider.of<LoginViewModel>(context, listen: false).isLogin) {
                Provider.of<LoginViewModel>(context, listen: false).check();
                Provider.of<DonationProvider>(context, listen: false).loadDonation(LoginViewModel.userId);
              }
            }
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
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
      ),
      body: WillPopScope(
        onWillPop: onWillPop,
        child: IndexedStack(
          index: _currentIndex,
          children: [
            Search(),
            MainPage(),
            MyPage(),
          ],
        ),
      ),
    );
  }
}

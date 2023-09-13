import 'package:flutter/material.dart';
import 'package:givoo/pages/mainpage/view/mainpage.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/provider/MyPageProvider.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:provider/provider.dart';

import 'component/view/bottomnavbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MyPageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => OrganizationProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => DonationProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '기부어때',
          theme: ThemeData(
            useMaterial3: false,
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: Colors.white,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: Colors.black)),
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
          ),
          home: BotNavBar(),
        ));
  }
}

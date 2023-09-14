import 'package:flutter/material.dart';
import 'package:givoo/config/loading.dart';
import 'package:givoo/pages/login/viewmodel/kakao_login.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/login/viewmodel/social_login.dart';
import 'package:givoo/pages/pay/view/pay.dart';
import 'package:givoo/pages/mainpage/view/mainpage.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/pages/recommend/view/recommend.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/provider/MyPageProvider.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/provider/PayCategoryProvider.dart';
import 'package:givoo/provider/UserProvider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:givoo/provider/RecommendMoreProvider.dart';
import 'package:provider/provider.dart';

import 'component/view/bottomnavbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
      nativeAppKey: 'e61d743ad3d9819502abe521a4b1584b',
      javaScriptAppKey: 'b922d230ead129047285d1c296c0b597'
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(   // 내 단체 확인
            create: (context) => MyPageProvider(),
          ),
          ChangeNotifierProvider(   // 기관 정보 확인
            create: (context) => OrganizationProvider(),
          ),
          ChangeNotifierProvider(   // 후원 이력 확인
            create: (context) => DonationProvider(),
          ),
          ChangeNotifierProvider(   // 유저정보 확인
            create: (context) => UserInfoProvider(),
          ),
          ChangeNotifierProvider(   // 로그인 확인
              create: (context) => LoginViewModel(KakaoLogin()),
          ),
          ChangeNotifierProvider(create:(context)=>PayCategoryProvider()),

          ChangeNotifierProvider(
              create:(context)=> RecommendMoreProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '기부어때',
          theme: ThemeData(
            //TODO: 다크모드 설정하기
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
          home: Pay(),
          //home: Loading(),
        ));
  }
}

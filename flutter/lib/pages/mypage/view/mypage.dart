import 'package:flutter/material.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/login/viewmodel/kakao_login.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/provider/UserProvider.dart';
import 'package:givoo/services/LoginService.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserInfoProvider>(context, listen: false).loadUserInfo();
  }


  Future tokenFind() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo() as AccessTokenInfo;
      print("tokenInfo: ${tokenInfo.id}");
      if(tokenInfo != null){
        print('1');
        FindByToken findByToken = FindByToken();
        var rootToken = findByToken.findUserInfo(tokenInfo.id);
        print('2');
        return rootToken;
      } else {
        return LogIn();
      }
    } catch (e) {
      print(e);
    }
  }

  final viewModel = LoginViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tokenFind();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              )),
        )
      ]),
      body: Consumer<UserInfoProvider>(builder: (context, prv, child) {
        return Column(
          children: [
            SizedBox(
              height: 0,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Image.network(provider.kakaoInfo["user_Name"].toString()),
                  SizedBox(
                    height: 70,
                  ),
                  Text(prv.kakaoUser["userName"]as String),

                  // Text('${viewModel.isLogin}'),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('나의 활동'),
                  SizedBox(
                    height: 30,
                  ),
                  TextButtonTheme(
                    data: TextButtonThemeData(),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainMyGroup(),
                                ));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '내 단체',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DonationHistory(),
                                ));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '기부 이력 확인',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '정기 기부 관리',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            viewModel.logout();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                size: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '로그아웃',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}



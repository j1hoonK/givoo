import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/kakao_login.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final viewModel = LoginViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    findToken();
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
      body: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    viewModel.user?.kakaoAccount?.profile?.profileImageUrl ??
                        ''),
                SizedBox(
                  height: 70,
                ),
                Text(viewModel.user?.kakaoAccount?.profile?.nickname ?? ''),
                Text('${viewModel.isLogin}'),
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
      ),
    );
  }
}

void findToken()async{
  try {
    AccessTokenInfo tokenInfo =
    await UserApi.instance.accessTokenInfo();
    print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
  } catch (error) {
    if (error is KakaoException && error.isInvalidTokenError()) {
      print('토큰 만료 $error');
    } else {
      print('토큰 정보 조회 실패 $error');
    }

    try {
      // 카카오계정으로 로그인
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('로그인 실패 $error');
    }
  }
}
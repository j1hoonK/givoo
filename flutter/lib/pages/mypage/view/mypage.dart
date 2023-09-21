import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/provider/UserProvider.dart';
import 'package:givoo/services/LoginService.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserInfoProvider>(context, listen: false)
        .loadUserInfo(); // 로그인한 유저정보 조회
  }

  @override
  Widget build(BuildContext context) {
    // TODO: 전체 페이지 MediaQuery 통일(mSize, mHight 각각 약 10px에 해당함)
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;

    final isLoginNow = Provider.of<LoginViewModel>(context);
    final userInfo = Provider.of<UserInfoProvider>(context);

    // 로그인된 사용자 정보 확인
    findUserData() async {
      // 로그인여부 확인_ 로그인됨: true, 로그아웃됨: false
      if (isLoginNow.isLogin) {
        try {
          AccessTokenInfo tokenInfo =
              await UserApi.instance.accessTokenInfo(); // 토큰정보 확인
          print("Token Information == $tokenInfo");
          FindByToken findByToken = FindByToken(); // 확인된 토큰ID로 회원정보 조회
          return await findByToken.findUserInfo(tokenInfo.id);
        } catch (e) {
          print("Error = $e");
        }
      }
    }

    findUserData();
    print('isLoginNow?? == ${isLoginNow.isLogin}');
    // 로그인 완료 => MyPage, 로그인 미완료 => LoginPage
    if (isLoginNow.isLogin) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white),
          elevation: 0,
          toolbarHeight: mHeight * 2.1,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.network(
                      userInfo.kakaoUser[0].userImage,
                      width: mSize * 12,
                      height: mSize * 12,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: mHeight * 1,
                  ),
                  Text(
                    userInfo.kakaoUser[0].userEmail,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: mHeight * 0.5,
                  ),
                  Text(
                    userInfo.kakaoUser[0].userName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: mHeight * 4,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: mSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '나의 활동',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: mSize * 1,
                  ),
                  TextButtonTheme(
                    data: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(fontSize: 20)),
                    ),
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
                              ),
                              SizedBox(
                                width: mSize * 2,
                              ),
                              Text('내 단체'),
                            ],
                          ),
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
                                Icons.history_edu,
                              ),
                              SizedBox(width: mSize * 2),
                              Text('기부 이력 확인'),
                            ],
                          ),
                        ),
                        /*TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 30,
                              ),
                              SizedBox(
                                width: mSize * 2,
                              ),
                              Text(
                                '정기 기부 관리',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: mSize * 2,
                      ),
                      Text(
                        '기타 설정',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: mSize * 1,
                      ),
                      TextButtonTheme(
                        data: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            textStyle: TextStyle(
                              fontSize: 20
                            )
                          ),
                        ),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.announcement_outlined,
                                  ),
                                  SizedBox(width: mSize * 2),
                                  Text('공지사항'),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await isLoginNow.logout();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.question_answer_outlined,
                                  ),
                                  SizedBox(
                                    width: mSize * 2,
                                  ),
                                  Text('Q&A'),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.menu_book_outlined,
                                  ),
                                  SizedBox(
                                    width: mSize * 2,
                                  ),
                                  Text('약관 및 정책'),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await isLoginNow.logout();
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                  ),
                                  SizedBox(
                                    width: mSize * 2,
                                  ),
                                  Text('로그아웃'),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.highlight_off,
                                  ),
                                  SizedBox(
                                    width: mSize * 2,
                                  ),
                                  Text('회원 탈퇴'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
    } else {
      return logIn();
    }
  }
}

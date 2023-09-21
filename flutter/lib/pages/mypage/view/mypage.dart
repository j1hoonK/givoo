import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/UserProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: 전체 페이지 MediaQuery 통일(mSize, mHight 각각 약 10px에 해당함)
    var mSize =  MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;

    final isLoginNow = Provider.of<LoginViewModel>(context);
    print("isLoginnow : ${isLoginNow.isLogin}");
    // 로그인된 사용자 정보 확인
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
        body: Consumer<UserInfoProvider>(builder: (context,provider,child)=>
            SingleChildScrollView(
            child: Column(children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.network(
                        provider.kakaoUser[0].userImage,
                        width: mSize * 12,
                        height: mSize * 12,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 1,
                    ),
                    Text(
                      provider.kakaoUser[0].userEmail,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: mHeight * 0.5,
                    ),
                    Text(
                      provider.kakaoUser[0].userName,
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
                              context.push("/mypage/org");
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
                              context.push("/mypage/dnthistory");
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
                                onPressed: () {},
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
        ),
      );
    } else {
      return logIn();
    }
  }
}

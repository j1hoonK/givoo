import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/config/palette.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/login/view/login_first.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/services/LoginService.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
void main() { runApp(MyPage());}
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    return Consumer<LoginViewModel>(
      builder: (context, provider, child) => provider.isLogin
          ? provider.kakaoUser[0].userAddress == 'null'
              ? FirstLogin()
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: BaseAppbar(),
                  /*AppBar(
                    systemOverlayStyle:
                        SystemUiOverlayStyle(statusBarColor: Colors.white),
                    elevation: 0,
                    toolbarHeight: mHeight * 2.1,
                  ),*/
                  body: SingleChildScrollView(
                    child: Column(children: [
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: mHeight * 5,),
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
                            /*Text(
                              provider.kakaoUser[0].userEmail,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),*/
                            SizedBox(
                              height: mHeight * 0.5,
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                                children: [
                                TextSpan(text: provider.kakaoUser[0].userName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                                TextSpan(text: '님 환영합니다!', style: TextStyle(color: Colors.black)),
                                ]
                              ),
                            ),
                            SizedBox(
                              height: mHeight * 5,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(mSize * 2, 0, mSize * 2, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            color: Colors.grey[300],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '나의 활동',
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold, color: Palette.mainColor),
                                ),
                                SizedBox(
                                  height: mSize * 1,
                                ),
                                TextButtonTheme(
                                  data: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                        foregroundColor: Palette.textColor1,
                                        textStyle: TextStyle(fontSize: 20)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(children: [
                                      Flexible(
                                        child: TextButton(
                                          onPressed: () {
                                            context.push("/mypage/org");
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.favorite_border,
                                              ),
                                              SizedBox(
                                                width: mSize * 1.5,
                                              ),
                                              Text('내 단체'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextButton(
                                          onPressed: () {
                                            context.push("/mypage/dnthistory");
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.history_edu,
                                              ),
                                              SizedBox(width: mSize * 1.5),
                                              Text('기부 이력'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ]),
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
                                      '기타',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        color: Palette.mainColor
                                      ),
                                    ),
                                    SizedBox(
                                      height: mSize * 1,
                                    ),
                                    TextButtonTheme(
                                      data: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                            foregroundColor: Palette.textColor1,
                                            textStyle: TextStyle(fontSize: 20)),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(children: [
                                          Flexible(
                                            child: TextButton(
                                              onPressed: () {
                                                context.push('/mypage/announce');
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.announcement_outlined,
                                                  ),
                                                  SizedBox(width: mSize * 1.5),
                                                  Text('공지사항'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: TextButton(
                                              onPressed: () {
                                                context.push('/mypage/qna');
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.question_answer_outlined,
                                                  ),
                                                  SizedBox(
                                                    width: mSize * 1.5,
                                                  ),
                                                  Text('Q&A'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ]),
                                          TextButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.menu_book_outlined,
                                                ),
                                                SizedBox(
                                                  width: mSize * 1.5,
                                                ),
                                                Text('약관 및 정책'),
                                              ],
                                            ),
                                          ),
                                          Row(children: [
                                          Flexible(
                                            child: TextButton(
                                              onPressed: () {
                                                provider.logout();
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.logout,
                                                  ),
                                                  SizedBox(
                                                    width: mSize * 1.5,
                                                  ),
                                                  Text('로그아웃'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: TextButton(
                                              onPressed: () {
                                                deleteUser(provider.kakaoUser[0].token);
                                                print('logout 시도');
                                                provider.logout().then((value) => context.push('/Search'));
                                                print('timer Start');
                                                Timer(Duration(milliseconds: 2000), () {
                                                  context.push('/main');
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.highlight_off,
                                                  ),
                                                  SizedBox(
                                                    width: mSize * 1.5,
                                                  ),
                                                  Text('회원 탈퇴'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                )
          : logIn(),
    );
  }
}

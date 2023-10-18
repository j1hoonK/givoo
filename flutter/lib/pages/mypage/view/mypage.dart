import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givoo/config/palette.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/login/view/login_first.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/services/LoginService.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "기부영수증 전송",
      "전자기부금영수증 신청(홈텍스신고)",
      "문의사항",
      "공지사항",
      "약관/정책"
    ];
    List<String> pushList = [
      "/mypage/announce",
      "/mypage/announce",
      "/mypage/inquiry",
      "/mypage/announce",
      "/mypage/terms"
    ];
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<LoginViewModel>(
      builder: (context, provider, child) => provider.isLogin
          ? provider.kakaoUser[0].userAddress == 'null'
              ? FirstLogin()
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    centerTitle: true,
                    elevation: 0.0,
                    backgroundColor: Colors.lightBlue,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                            onPressed: () {
                              provider.logout();
                            },
                            icon: Icon(Icons.logout)),
                      )
                    ],
                    title: Container(
                      margin: EdgeInsets.fromLTRB(0, height * 0.01, 0, 0),
                      child: Image.asset(
                        'images/login/logo.png',
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                  ),
                  body: Column(children: [
                    Container(
                      height: height * 0.18,
                      color: Colors.lightBlue,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(42),
                                  child: Image.network(
                                    provider.kakaoUser[0].userImage,
                                    width: mSize * 11,
                                    height: mSize * 11,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        provider.kakaoUser[0].userName,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    SizedBox(
                                      width: width * 0.6,
                                      child: Text(
                                        "님은 세상을 따뜻하게 만드는 기부에\n참여하고 계십니다",
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
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
                    Container(
                      margin: EdgeInsets.fromLTRB(15, height * 0.008, 15, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            // height: height * 0.15,
                            width: width,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    height: height * 0.08,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.heart_fill,
                                                color: Colors.red,
                                                size: 25,
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Text(
                                                "기부금액",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "${NumberFormat.currency(symbol: "", locale: 'ko_KR').format(DonationProvider.totalAmount)} 원",
                                          style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(
                                              12)), // 테두리 모양과 크기 설정
                                    ),
                                    alignment: Alignment.center,
                                    height: height * 0.06,
                                    width: width,
                                    child: Text(
                                      "Wow!! 이렇게 많은 기부를 하고 계시네요.",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                            width: width,
                            child: Card(
                              color: Colors.grey.shade200,
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.push("/mypage/dnthistory");
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            CupertinoIcons.list_bullet,
                                            color: Colors.orangeAccent,
                                          ),
                                          SizedBox(height: height * 0.005),
                                          Text("기부내역")
                                        ],
                                      ),
                                    ),
                                    VerticalDivider(
                                        thickness: 1,
                                        width: 1,
                                        color: Colors.white),
                                    Column(
                                      children: [
                                        Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.orangeAccent,
                                        ),
                                        SizedBox(height: height * 0.005),
                                        Text("기부금 공제")
                                      ],
                                    ),
                                    VerticalDivider(
                                        thickness: 1,
                                        width: 1,
                                        color: Colors.white),
                                    InkWell(
                                      onTap: () {
                                        context.push("/mypage/org");
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            CupertinoIcons.bookmark_fill,
                                            color: Colors.orangeAccent,
                                          ),
                                          SizedBox(height: height * 0.005),
                                          Text("내 기부단체")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: height * 0.36,
                        child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) =>
                                const Divider(),
                            itemCount: list.length,
                            itemBuilder: (context, idx) {
                              return SizedBox(
                                height: height * 0.05,
                                child: ListTile(
                                  onTap: () {
                                    context.push(pushList[idx]);
                                  },
                                  leading: Text(list[idx]),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              );
                            }),
                      ),
                    )
                    /*   Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.fromLTRB(mSize * 2, 0, mSize * 2, 0),
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
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.mainColor),
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
                                            context
                                                .push("/mypage/dnthistory");
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
                                        color: Palette.mainColor),
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
                                                context
                                                    .push('/mypage/announce');
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .announcement_outlined,
                                                  ),
                                                  SizedBox(
                                                      width: mSize * 1.5),
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
                                                    Icons
                                                        .question_answer_outlined,
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
                                                deleteUser(provider
                                                    .kakaoUser[0].token);
                                                print('logout 시도');
                                                provider.logout().then(
                                                    (value) => context
                                                        .push('/Search'));
                                                print('timer Start');
                                                Timer(
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () {
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
                    ),*/
                  ]),
                )
          : logIn(),
    );
  }
}

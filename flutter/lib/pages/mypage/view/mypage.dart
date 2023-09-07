import 'package:flutter/material.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';


class MyPage extends StatelessWidget {
  MyPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              ))
        ]),
        body: Column(children: [
          SizedBox(
            height: 80,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/login/logo.png',
                    width: MediaQuery.of(context).size.width * 0.45),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Baro',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MainMyGroup(),));
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DonationHistory(),));
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
                      ],
                  ),
                ),
              ],
            ),
          ),
        ]),

    );
  }
}

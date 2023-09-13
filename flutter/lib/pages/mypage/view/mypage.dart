import 'package:flutter/material.dart';
import 'package:givoo/pages/login/view/login.dart';
import 'package:givoo/pages/login/viewmodel/kakao_login.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/pages/login/viewmodel/social_login.dart';
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

  tokenFind() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      print("Token Information == $tokenInfo");
        print('1');
        FindByToken findByToken = FindByToken();
        var rootToken = findByToken.findUserInfo(tokenInfo.id);
        print('rootToken == $rootToken');
        return rootToken;
    } catch (e) {
      print("Error = $e");
      if(e is KakaoException){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<LoginViewModel>(context);
    final viewModel = LoginViewModel(KakaoLogin());
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
   tokenFind();

    return


      Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {setState(() {

              });},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
                size: mHeight * 3,
              )),
        )
      ]),
      body: Column(
        children: [
          Center(
            child: Consumer<UserInfoProvider>(
              builder: (context, provider, child) =>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mHeight * 2,
                      ),
                  /*    ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.network(
                          //provider.kakaoUser[0].userImage,
                          width: mSize * 15,
                          height: mSize * 15,
                          fit: BoxFit.contain,
                        ),
                      ),*/
                      SizedBox(
                        height: mHeight * 2,
                      ),
                      //Text(provider.kakaoUser[0].userEmail),
                      //Text(provider.kakaoUser[0].userName),
                      Text('data:${data.isLogin}'),
                      SizedBox(
                        height: mHeight * 5,
                      ),
                    ],
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: mSize * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('나의 활동'),
                SizedBox(
                  height: mSize * 2.5,
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
                              size: mSize * 3,
                            ),
                            SizedBox(
                              width: mSize * 2,
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
                        height: mSize * 1,
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
                              width: mSize * 2,
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
                          height: mSize * 1
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
                              width: mSize * 2,
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
                        height: mSize * 1,
                      ),
                      TextButton(
                        onPressed: () async{
                         await viewModel.logout().then((value) => setState((){}));
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 30,
                            ),
                            SizedBox(
                              width: mSize * 2,
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



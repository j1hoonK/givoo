import 'package:flutter/material.dart';
import 'package:givoo/component/view/loginbutton.dart';
import 'package:givoo/pages/login/viewmodel/kakao_login.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final viewModel = LoginViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      // 로그인버튼 테마
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                minimumSize: Size.fromHeight(60),
                textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120,),
            Image.network(viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(viewModel.user?.kakaoAccount?.profile?.nickname ?? ''),
            Text('${viewModel.isLogin}'),
            //Image.asset('images/login/logo.png',width: 200,),
            SizedBox(height: 170),
            // Google Login
            LoginButton(
              image: Image.asset('images/login/glogo.png'),
              text: Text('Login with Goggle',
                  style: TextStyle(color: Colors.black)), color: Color(0xffececef), onPressed: () {  },
            ),
            SizedBox(height: 10,),
            // Naver Login
            LoginButton(
                color: Color(0xff00bf18),
                image: Image.asset('images/login/naver.png', width: 35,),
                onPressed: (){},
                text: Text('Login with Naver',
                    style: TextStyle(color: Colors.white))
            ),
            SizedBox(height: 10,),
            // Kakao Login
            LoginButton(
                color: Color(0xfff8d000),
                image: Image.asset('images/login/kakao.png', width: 30),
                onPressed: () async{
                  await viewModel.login();
                  print(viewModel.user);
                },
                text: Text('Login with kakao',
                    style: TextStyle(color: Colors.black))
            ),
          ],
        ),
      ),
    );
  }
}

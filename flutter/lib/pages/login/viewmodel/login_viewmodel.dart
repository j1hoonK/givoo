import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/social_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginViewModel with ChangeNotifier{
  final SocialLogin _socialLogin;
  LoginViewModel(this._socialLogin);

  bool _isLogin = false;
  User? user;
  bool get isLogin => _isLogin;


  // 로그인 완료 => isLogin = true
  Future login() async {
    _isLogin = await _socialLogin.login();
    user = await UserApi.instance.me();
    notifyListeners();
  }

  // 로그아웃 완료 => isLogin = false
  Future logout() async {
    await _socialLogin.logout();
    _isLogin = false;
    user = null;
    notifyListeners();
  }
}
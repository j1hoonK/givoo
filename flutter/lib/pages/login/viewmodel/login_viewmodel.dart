import 'package:givoo/pages/login/viewmodel/social_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class LoginViewModel{
  final SocialLogin _socialLogin;
  bool isLogin = false;
  User? user;

  LoginViewModel(this._socialLogin);

  Future login() async {
    isLogin = await _socialLogin.login();
    if(isLogin){
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogin = false;
    user = null;
  }
}
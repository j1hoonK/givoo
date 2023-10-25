import 'package:flutter/material.dart';
import 'package:givoo/pages/login/model/kakaoLogin.dart';
import 'package:givoo/pages/login/viewmodel/social_login.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/services/LoginService.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../model/join_kakao_login.dart';

class LoginViewModel with ChangeNotifier{
  final SocialLogin _socialLogin;
  LoginViewModel(this._socialLogin);
  User? user;
  String? token;
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  List<dynamic> _kakaoUser = [];
  List<dynamic> get kakaoUser => _kakaoUser;
  final DonationProvider _donationProvider = DonationProvider();
  final FindByToken _findByToken = FindByToken();
  final FindByTokenFirst _findByTokenFirst = FindByTokenFirst();
  static String userId ="0";
  static String userName="";
  static var userNumberFirst = 0;
  static var userNumberSecond = 0;

  // 로그인 완료 => isLogin = true
  Future login() async {
    _isLogin = await _socialLogin.login();
    user = await UserApi.instance.me();

    // 유저정보 확인
    AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
    token = tokenInfo.id.toString();
    print('(login_viewmodel.dart)tokenId == $token');
    // 확인된 토큰ID를 Api서버로 전송 >> 회원정보 습득
    List<JoinKakaoUser> nowUserInfo = await _findByTokenFirst.findJoinUserInfo(tokenInfo.id);
    // _kakaoUser에 회원정보 저장
    _kakaoUser = nowUserInfo;
    print('KakoUserData ======= $_kakaoUser');
     //Donation 정보 최신화
    print('(login_viewmodel.dart) loadDonation Start');
    await _donationProvider.loadDonation(userId);
    userId=_kakaoUser[0].userId;
    userName=_kakaoUser[0].userName;
    notifyListeners();
  }

  Future check() async{
    // 유저정보 확인
    AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
    token = tokenInfo.id.toString();
    print('(login_viewmodel.dart)_tokenId == $token');
    // 확인된 토큰ID를 Api서버로 전송 >> 회원정보 습득
    List<KakaoUser> nowUserInfo = await _findByToken.findUserInfo(tokenInfo.id);
    // _kakaoUser에 회원정보 저장
    _kakaoUser = nowUserInfo;
    userId=_kakaoUser[0].userId;
    userName=_kakaoUser[0].userName;
    userNumberFirst = _kakaoUser[0].userNumberFirst;
    userNumberSecond = _kakaoUser[0].userNumberSecond;
    User user = await UserApi.instance.me();
    print('useruseruser == $user');

    notifyListeners();
  }

  // 로그아웃 완료 => isLogin = false
  Future logout() async {
    await _socialLogin.logout();
    _isLogin = false;
    user = null;
    print('Logout 완료');
    notifyListeners();
  }

  // 회원 탈퇴
  deleteUser(token){


  }

}
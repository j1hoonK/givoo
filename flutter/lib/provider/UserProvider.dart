import 'package:flutter/material.dart';
import 'package:givoo/pages/login/model/kakaoLogin.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../pages/login/viewmodel/kakao_login.dart';
import '../services/LoginService.dart';

//
// class UserProvider with ChangeNotifier{
//   final KakaoLogin _kakaoLogin = KakaoLogin();
//   Map<String, String> _kakaoInfo = {};
//   Map<String, String> get kakaoInfo => _kakaoInfo;
//
//   loadKakaoInfo(){
//     Map<String, String> userInfoFromKakao = _kakaoLogin.kakaoUser;
//     _kakaoInfo = userInfoFromKakao;
//     notifyListeners();
//   }
// }

class UserInfoProvider with ChangeNotifier{
  final FindByToken _findByToken = FindByToken();
  List<dynamic> _kakaoUser = [];
  List<dynamic> get kakaoUser => _kakaoUser;

  // 유저정보 확인
  loadUserInfo() async {
    // 토큰 정보 확인
    AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
    // 확인된 토큰ID를 Api서버로 전송 >> 회원정보 습득
    List<KakaoUser> nowUserInfo = await _findByToken.findUserInfo(tokenInfo.id);
    // _kakaoUser에 회원정보 저장
    _kakaoUser = nowUserInfo;
    notifyListeners();
  }
}
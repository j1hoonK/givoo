import 'package:flutter/services.dart';
import 'package:givoo/pages/login/viewmodel/social_login.dart';
import 'package:givoo/services/LoginService.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

// 카카오 로그인
class KakaoLogin implements SocialLogin {
  Map<String, String> kakaoUser = {};

  @override
  Future<bool> login() async {
    // 로그인
    KakaoService kakaoService = KakaoService();

    try {
      // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
      if (await isKakaoTalkInstalled()) {
        try {
          User user = await UserApi.instance.me();
          OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
          print('카카오톡으로 로그인 성공_token:${token.accessToken}');
          var kakaoUser = {
            // 서버에 전송할 user 정보
            "login": "kakao",
            "token": user.id,
            "user_name": user.kakaoAccount?.profile?.nickname,
            "user_image": user.kakaoAccount?.profile?.profileImageUrl,
            "user_email": user.kakaoAccount?.email,
          };
          print('(kakao_login.dart)kakoUser1 == $kakaoUser');
          return true;
        } catch (error) {
          print('(kakao_login.dart)카카오톡으로 로그인 실패 $error');

          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') {
            return false;
          }
          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
            print('(kakao_login.dart)카카오계정으로 로그인 성공_token:${token.accessToken}');
            return true;
          } catch (error) {
            print('(kakao_login.dart)카카오계정으로 로그인 실패 $error');
            return false;
          }
        }
      } else {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('(kakao_login.dart)카카오계정으로 로그인 성공2');
          User user = await UserApi.instance.me();
          var kakaoUser = {
            // 서버에 전송할 user 정보
            "loginType": "kakao",
            "token": user.id,
            "userName": user.kakaoAccount?.profile?.nickname,
            "userImage": user.kakaoAccount?.profile?.profileImageUrl,
            "userEmail": user.kakaoAccount?.email,
          };
          print('(kakao_login.dart)kakaoUser2 == $kakaoUser');
          print('(kakao_login.dart)Token == ${kakaoUser["token"]}');
          kakaoService.sendKakaoLogin(kakaoUser);
          return true;
        } catch (error) {
          print('(kakao_login.dart)카카오계정으로 로그인 실패2 $error');
          return false;
        }
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    // 로그아웃
    try {
      await UserApi.instance.unlink();
      return false;
    } on Exception catch (e) {
      return false;
    }
  }
}


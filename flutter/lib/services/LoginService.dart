import 'dart:convert';
import 'package:http/http.dart' as http;

import '../pages/login/model/kakaoLogin.dart';
import '../pages/login/viewmodel/kakao_login.dart';

class KakaoService {
  KakaoLogin kakaoLogin = KakaoLogin();
  Map<String, String> kakaoUserData = KakaoLogin().kakaoUser;

  // 회원가입
  Future<void> sendKakaoLogin(kakaoUserData) async {
    var url = "http://10.0.2.2:1000/login/kakao/${kakaoUserData["token"]}";
    print('url: $url');
    print('전송요청 >> KakaoUser:$kakaoUserData');
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": 'application/json'},
      body: json.encode(kakaoUserData),
    );

    if (response.statusCode == 200) {
      print("OK: ${response.body}");
    } else {
      print("NG: ${response.statusCode}");
      print("Messege: ${response.body}");
    }
  }
}

class FindByToken {
  // 회원정보 조회
  Future<List<KakaoUser>> findUserInfo(tokenId) async {
    print("[Run] findUserInfo");
    var url = "http://10.0.2.2:1000/login/$tokenId";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("StatuseCode == 200");
      List<dynamic> userInfo = jsonDecode(utf8.decode(response.bodyBytes));
      print("userInfo: $userInfo");
      return userInfo
          .map<KakaoUser>((item) => KakaoUser.fromJson(item))
          .toList();
    } else {
      print("[Fail] getUserInfo");
      throw Exception("fail to find User Information");
    }
  }
}

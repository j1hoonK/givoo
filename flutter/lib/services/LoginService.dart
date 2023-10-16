import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givoo/config/url.dart';
import 'package:givoo/pages/login/view/login_first.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../config/custom_url.dart';
import '../pages/login/model/kakaoLogin.dart';
import '../pages/login/viewmodel/kakao_login.dart';

class KakaoService {
  KakaoLogin kakaoLogin = KakaoLogin();
  Map<String, String> kakaoUserData = KakaoLogin().kakaoUser;

  // 회원가입
  Future<void> sendKakaoLogin(kakaoUserData) async {
    var url = "${CustomUrl.url}/login/kakao/${kakaoUserData["token"]}";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": 'application/json'},
      body: json.encode(kakaoUserData),
    );
      print("(LoginService.dart)UserData: ${json.encode(kakaoUserData)}");

    if (response.statusCode == 200) {
      print("(LoginService.dart)SignUp OK: ${response.body}");
    } else {
      print("(LoginService.dart)SignUp NG: ${response.statusCode}");
      print("(LoginService.dart)SignUp Messege: ${response.body}");
    }
  }
}

// 최초정보 업데이트
Future<void> updateKakaoUser(userFirstInfo) async {
  var url = "${CustomUrl.url}/login/kakao/updateinfo/${userFirstInfo["token"]}";
  http.Response response = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": 'application/json'},
    body: json.encode(userFirstInfo),
  );
  print("(LoginService.dart)UpdateUserData: ${json.encode(userFirstInfo)}");

  if (response.statusCode == 200) {
    print("(LoginService.dart)Update OK: ${response.body}");
  } else {
    print("(LoginService.dart)Update NG: ${response.statusCode}");
    print("(LoginService.dart)Update Messege: ${response.body}");
  }
}

class FindByToken {
  // 회원정보 조회
  Future<List<KakaoUser>> findUserInfo(tokenId) async {
    var url = "${CustomUrl.url}/login/$tokenId";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print("(LoginService.dart)findUserInfo OK: ${response.body}");
      List<dynamic> userInfo = jsonDecode(utf8.decode(response.bodyBytes));
      print("(LoginService.dart)userInfo == $userInfo");
      return userInfo
          .map<KakaoUser>((item) => KakaoUser.fromJson(item))
          .toList();
    } else {
      throw Exception("fail to find User Information");
    }
  }
}

Future deleteUser(token) async {
  try{
  print('Delete Start_token: $token');
  var url = "${CustomUrl.url}/login/delete/$token";
  http.Response response = await http.delete(Uri.parse(url));
  print('Delete 요청완료');
  if(response.statusCode == 200) {
    print('(LoginService.dart)회원 탈퇴 성공');
  }
  }catch(e){
    print(e);
  }
}
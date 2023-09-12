import 'dart:convert';

KakaoUser kakaoUserFromJson(String str) => KakaoUser.fromJson(json.decode(str));

String kakaoUserToJson(KakaoUser data) => json.encode(data.toJson());

class KakaoUser {
  String loginType;
  String token;
  String userName;
  String userImage;
  String userEmail;

  KakaoUser({
    required this.loginType,
    required this.token,
    required this.userName,
    required this.userImage,
    required this.userEmail,
  });

  factory KakaoUser.fromJson(Map<String, dynamic> json) => KakaoUser(
    loginType: json["loginType"].toString(),
    token: json["token"].toString(),
    userName: json["userName"].toString(),
    userImage: json["userImage"].toString(),
    userEmail: json["userEmail"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "loginType": loginType.toString(),
    "token": token.toString(),
    "userName": userName.toString(),
    "userImage": userImage.toString(),
    "userEmail": userEmail.toString(),
  };
}
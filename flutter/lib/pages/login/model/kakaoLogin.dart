import 'dart:convert';

KakaoUser kakaoUserFromJson(String str) => KakaoUser.fromJson(json.decode(str));

String kakaoUserToJson(KakaoUser data) => json.encode(data.toJson());

class KakaoUser {
  var userId;
  String loginType;
  String token;
  String userName;
  String userImage;
  String userEmail;
  var userAddress;

  KakaoUser({
    required this.userId,
    required this.loginType,
    required this.token,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.userAddress,
  });

  factory KakaoUser.fromJson(Map<String, dynamic> json) => KakaoUser(
    userId: json["userId"].toString(),
    loginType: json["loginType"].toString(),
    token: json["token"].toString(),
    userName: json["userName"].toString(),
    userImage: json["userImage"].toString(),
    userEmail: json["userEmail"].toString(),
    userAddress: json["userAddress"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "userId":userId.toString(),
    "loginType": loginType.toString(),
    "token": token.toString(),
    "userName": userName.toString(),
    "userImage": userImage.toString(),
    "userEmail": userEmail.toString(),
    "userAddress": userAddress.toString(),

  };
}
import 'dart:convert';

List<Notice> noticeFromJson(String str) => List<Notice>.from(json.decode(str).map((x) => Notice.fromJson(x)));

String noticeToJson(List<Notice> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notice {
  int noticeId;
  String noticeBody;
  String noticeSubject;
  String noticeDate;

  Notice({
    required this.noticeId,
    required this.noticeBody,
    required this.noticeSubject,
    required this.noticeDate,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
    noticeId: json["noticeId"],
    noticeBody: json["noticeBody"],
    noticeSubject: json["noticeSubject"],
    noticeDate: json["noticeDate"],
  );

  Map<String, dynamic> toJson() => {
    "noticeId": noticeId,
    "noticeBody": noticeBody,
    "noticeSubject": noticeSubject,
    "noticeDate": noticeDate,
  };
}
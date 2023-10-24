// To parse this JSON data, do
//
//     final orgNoticeModel = orgNoticeModelFromJson(jsonString);

import 'dart:convert';

List<OrgNoticeModel> orgNoticeModelFromJson(String str) => List<OrgNoticeModel>.from(json.decode(str).map((x) => OrgNoticeModel.fromJson(x)));

String orgNoticeModelToJson(List<OrgNoticeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrgNoticeModel {
  int noticeId;
  String subject;
  int orgId;
  String contents;
  DateTime noticeDate;
  bool noticeFlag;

  OrgNoticeModel({
    required this.noticeId,
    required this.subject,
    required this.orgId,
    required this.contents,
    required this.noticeDate,
    required this.noticeFlag,
  });

  factory OrgNoticeModel.fromJson(Map<String, dynamic> json) => OrgNoticeModel(
    noticeId: json["noticeId"],
    subject: json["subject"],
    orgId: json["orgId"],
    contents: json["contents"],
    noticeDate: DateTime.parse(json["noticeDate"]),
    noticeFlag: json["noticeFlag"],
  );

  Map<String, dynamic> toJson() => {
    "noticeId": noticeId,
    "subject": subject,
    "orgId": orgId,
    "contents": contents,
    "noticeDate": noticeDate.toIso8601String(),
    "noticeFlag": noticeFlag,
  };
}

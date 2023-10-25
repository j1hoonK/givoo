import 'dart:convert';

List<Donation> donationFromJson(String str) => List<Donation>.from(json.decode(str).map((x) => Donation.fromJson(x)));

String donationToJson(List<Donation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Donation {
  String orgName;
  int dntId;
  int dntAmount;
  String dntDate;
  var receiptResult;
  int orgId;
  int userId;
  var typePayment;
  //String dntComment;
  var isRegulation;
  var dntCommentRegulation;
  var dntType;

  Donation({
    required this.orgName,
    required this.dntId,
    required this.dntAmount,
    required this.dntDate,
    this.receiptResult,
    required this.orgId,
    required this.userId,
    this.typePayment,
    //required this.dntComment,
    this.isRegulation,
    this.dntCommentRegulation,
    this.dntType,
  });

  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
    orgName: json["orgName"],
    dntId: json["dntId"],
    dntAmount: json["dntAmount"],
    dntDate: json["dntDate"],
    receiptResult: json["receiptResult"],
    orgId: json["orgId"],
    userId: json["userId"],
    typePayment: json["typePayment"],
    // dntComment: json["dntComment"],
    isRegulation: json["isRegulation"],
    dntCommentRegulation: json["dntCommentRegulation"],
    dntType: json["dntType"],
  );

  Map<String, dynamic> toJson() => {
    "orgName": orgName,
    "dntId": dntId,
    "dntAmount": dntAmount,
    "dntDate": dntDate,
    "receiptResult": receiptResult,
    "orgId": orgId,
    "userId": userId,
    "typePayment": typePayment,
    //"dntComment": dntComment,
    "isRegulation": isRegulation,
    "dntCommentRegulation": dntCommentRegulation,
    "dntType": dntType,
  };
}
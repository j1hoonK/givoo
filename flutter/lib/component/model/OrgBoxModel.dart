import 'dart:convert';

List<Organization> organizationFromJson(String str) => List<Organization>.from(json.decode(str).map((x) => Organization.fromJson(x)));

String organizationToJson(List<Organization> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Organization {
  int orgId;
  String orgName;
  dynamic orgOwnnumber;
  int orgNumber;
  String orgAddress;
  dynamic zip;
  double locationLat;
  double locationLong;
  String orgTell;
  String orgType;
  dynamic orgInfo;
  dynamic orgNotice;
  String orgOwner;
  String startedUp;
  dynamic accountNumber;
  dynamic bankName;
  dynamic accountHolder;
  dynamic imagePath;
  dynamic homepage;
  int totalFavorite;

  Organization({
    required this.orgId,
    required this.orgName,
    required this.orgOwnnumber,
    required this.orgNumber,
    required this.orgAddress,
    required this.zip,
    required this.locationLat,
    required this.locationLong,
    required this.orgTell,
    required this.orgType,
    required this.orgInfo,
    required this.orgNotice,
    required this.orgOwner,
    required this.startedUp,
    required this.accountNumber,
    required this.bankName,
    required this.accountHolder,
    required this.imagePath,
    required this.homepage,
    required this.totalFavorite,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    orgId: json["orgId"],
    orgName: json["orgName"],
    orgOwnnumber: json["orgOwnnumber"],
    orgNumber: json["orgNumber"],
    orgAddress: json["orgAddress"],
    zip: json["zip"],
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    orgTell: json["orgTell"],
    orgType: json["orgType"],
    orgInfo: json["orgInfo"],
    orgNotice: json["orgNotice"],
    orgOwner: json["orgOwner"],
    startedUp: json["startedUp"],
    accountNumber: json["accountNumber"],
    bankName: json["bankName"],
    accountHolder: json["accountHolder"],
    imagePath: json["imagePath"],
    homepage: json["homepage"],
    totalFavorite: json["totalFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "orgId": orgId,
    "orgName": orgName,
    "orgOwnnumber": orgOwnnumber,
    "orgNumber": orgNumber,
    "orgAddress": orgAddress,
    "zip": zip,
    "locationLat": locationLat,
    "locationLong": locationLong,
    "orgTell": orgTell,
    "orgType": orgType,
    "orgInfo": orgInfo,
    "orgNotice": orgNotice,
    "orgOwner": orgOwner,
    "startedUp": startedUp,
    "accountNumber": accountNumber,
    "bankName": bankName,
    "accountHolder": accountHolder,
    "imagePath": imagePath,
    "homepage": homepage,
    "totalFavorite": totalFavorite,
  };
}
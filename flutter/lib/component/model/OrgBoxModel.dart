import 'dart:convert';

List<Organization> organizationFromJson(String str) => List<Organization>.from(json.decode(str).map((x) => Organization.fromJson(x)));

String organizationToJson(List<Organization> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Organization {
  int orgId;
  String orgNumber;
  String orgName;
  String orgAddress;
  int locationLat;
  int locationLong;
  int orgTell;
  String orgType;
  String orgInfo;
  String orgOwner;
  DateTime startedUp;
  double accountNumber;
  String imagePath;
  int totalFavorite;

  Organization({
    required this.orgId,
    required this.orgNumber,
    required this.orgName,
    required this.orgAddress,
    required this.locationLat,
    required this.locationLong,
    required this.orgTell,
    required this.orgType,
    required this.orgInfo,
    required this.orgOwner,
    required this.startedUp,
    required this.accountNumber,
    required this.imagePath,
    required this.totalFavorite,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    orgId: json["orgId"],
    orgNumber: json["orgNumber"],
    orgName: json["orgName"],
    orgAddress: json["orgAddress"],
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    orgTell: json["orgTell"],
    orgType: json["orgType"],
    orgInfo: json["orgInfo"],
    orgOwner: json["orgOwner"],
    startedUp: DateTime.parse(json["startedUp"]),
    accountNumber: json["accountNumber"]?.toDouble(),
    imagePath: json["imagePath"],
    totalFavorite: json["totalFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "orgId": orgId,
    "orgNumber": orgNumber,
    "orgName": orgName,
    "orgAddress": orgAddress,
    "locationLat": locationLat,
    "locationLong": locationLong,
    "orgTell": orgTell,
    "orgType": orgType,
    "orgInfo": orgInfo,
    "orgOwner": orgOwner,
    "startedUp": startedUp.toIso8601String(),
    "accountNumber": accountNumber,
    "imagePath": imagePath,
    "totalFavorite": totalFavorite,
  };

}


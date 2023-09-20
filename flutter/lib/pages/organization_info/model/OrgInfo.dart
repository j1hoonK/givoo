import 'dart:convert';

OrgInfo orgInfoFromJson(String str) => OrgInfo.fromJson(json.decode(str));

String orgInfoToJson(OrgInfo data) => json.encode(data.toJson());

class OrgInfo {
  String orgName;
  String orgAddress;
  int locationLat;
  int locationLong;
  int orgTell;
  String orgInfo;
  String orgOwner;
  DateTime startedUp;
  String imagePath;
  int favId;

  OrgInfo({
    required this.orgName,
    required this.orgAddress,
    required this.locationLat,
    required this.locationLong,
    required this.orgTell,
    required this.orgInfo,
    required this.orgOwner,
    required this.startedUp,
    required this.imagePath,
    required this.favId,
  });

  factory OrgInfo.fromJson(Map<String, dynamic> json) => OrgInfo(
    orgName: json["orgName"],
    orgAddress: json["orgAddress"],
    locationLat: json["locationLat"],
    locationLong: json["locationLong"],
    orgTell: json["orgTell"],
    orgInfo: json["orgInfo"],
    orgOwner: json["orgOwner"],
    startedUp: DateTime.parse(json["startedUp"]),
    imagePath: json["imagePath"],
    favId: json["favId"],
  );

  Map<String, dynamic> toJson() => {
    "orgName": orgName,
    "orgAddress": orgAddress,
    "locationLat": locationLat,
    "locationLong": locationLong,
    "orgTell": orgTell,
    "orgInfo": orgInfo,
    "orgOwner": orgOwner,
    "startedUp": startedUp.toIso8601String(),
    "imagePath": imagePath,
    "favId": favId,
  };
}

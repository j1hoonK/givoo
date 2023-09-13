import 'dart:convert';

List<MyOrgList> myOrgListFromJson(String str) => List<MyOrgList>.from(json.decode(str).map((x) => MyOrgList.fromJson(x)));

String myOrgListToJson(List<MyOrgList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrgList {
  String orgName;
  String imagePath;
  String orgType;
  var orgId;
  String orgAddress;

  MyOrgList({
    required this.orgName,
    required this.imagePath,
    required this.orgType,
    required this.orgId,
    required this.orgAddress,
  });

  factory MyOrgList.fromJson(Map<String, dynamic> json) => MyOrgList(
    orgName: json["orgName"],
    imagePath: json["imagePath"],
    orgType: json["orgType"],
    orgId: json["orgId"],
    orgAddress: json["orgAddress"],
  );

  Map<String, dynamic> toJson() => {
    "orgName": orgName,
    "imagePath": imagePath,
    "orgType": orgType,
    "orgId": orgId,
    "orgAddress" :orgAddress,
  };

  String toString() {
    return 'MyOrgList{orgName: $orgName, imagePath: $imagePath, orgType: $orgType, orgId: $orgId, orgAddress:$orgAddress}';
  }
}

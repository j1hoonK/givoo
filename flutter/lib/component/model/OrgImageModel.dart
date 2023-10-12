// To parse this JSON data, do
//
//     final orgImage = orgImageFromJson(jsonString);

import 'dart:convert';

List<OrgImage> orgImageFromJson(String str) => List<OrgImage>.from(json.decode(str).map((x) => OrgImage.fromJson(x)));

String orgImageToJson(List<OrgImage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrgImage {
  int id;
  String originName;
  String saveName;
  String extension;
  String savePath;
  int orgId;
  String imageType;

  OrgImage({
    required this.id,
    required this.originName,
    required this.saveName,
    required this.extension,
    required this.savePath,
    required this.orgId,
    required this.imageType,
  });

  factory OrgImage.fromJson(Map<String, dynamic> json) => OrgImage(
    id: json["id"],
    originName: json["originName"],
    saveName: json["saveName"],
    extension: json["extension"],
    savePath: json["savePath"],
    orgId: json["orgId"],
    imageType: json["imageType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "originName": originName,
    "saveName": saveName,
    "extension": extension,
    "savePath": savePath,
    "orgId": orgId,
    "imageType": imageType,
  };
}

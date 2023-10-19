import 'dart:convert';

List<DonationType> donationTypeFromJson(String str) => List<DonationType>.from(json.decode(str).map((x) => DonationType.fromJson(x)));

String donationTypeToJson(List<DonationType> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonationType {
  int typeId;
  int orgId;
  String type;
  String defaultPay;

  DonationType({
    required this.typeId,
    required this.orgId,
    required this.type,
    required this.defaultPay,
  });

  factory DonationType.fromJson(Map<String, dynamic> json) => DonationType(
    typeId: json["typeId"],
    orgId: json["orgId"],
    type: json["type"],
    defaultPay: json["defaultPay"],
  );

  Map<String, dynamic> toJson() => {
    "typeId": typeId,
    "orgId": orgId,
    "type": type,
    "defaultPay": defaultPay,
  };
}

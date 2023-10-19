import 'dart:convert';

List<Inquiry> inquiryFromJson(String str) => List<Inquiry>.from(json.decode(str).map((x) => Inquiry.fromJson(x)));

String inquiryToJson(List<Inquiry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inquiry {
  int inquiryId;
  String title;
  String content;
  dynamic category;
  int userId;
  String createdAt;
  String status;
  dynamic answer;
  dynamic answerCreated;
  Inquiry({
    required this.inquiryId,
    required this.title,
    required this.content,
    required this.category,
    required this.userId,
    required this.createdAt,
    required this.status,
    required this.answer,
    required this.answerCreated,
  });

  factory Inquiry.fromJson(Map<String, dynamic> json) => Inquiry(
    inquiryId: json["inquiryId"],
    title: json["title"],
    content: json["content"],
    category: json["category"],
    userId: json["userId"],
    createdAt: json["createdAt"],
    status: json["status"],
    answer: json["answer"],
    answerCreated: json["answerCreated"],
  );

  Map<String, dynamic> toJson() => {
    "inquiryId": inquiryId,
    "title": title,
    "content": content,
    "category": category,
    "userId": userId,
    "createdAt": createdAt,
    "status": status,
    "answer": answer,
    "answerCreated":answerCreated,
  };
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:givoo/config/custom_url.dart';
import 'package:givoo/pages/mypage/model/Inquiry.dart';
import 'package:givoo/provider/InquiryProvider.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class InquiryService{
  Future<void> sendInquiry(String title, String content, userId) async {
    final url = Uri.parse("${CustomUrl.url}/mypage/inquiry/send");  // 서버의 URL로 변경하세요.
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'content': content,
        'userId' :userId,
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "문의가 성공적으로 완료되었습니다.",
        toastLength: Toast.LENGTH_SHORT, // 또는 Toast.LENGTH_LONG
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      //Provider.of<InquiryProvider>(context, listen: false).loadInquiry();
      print('요청이 성공했습니다.');

    } else {
      print('요청이 실패했습니다. 에러 코드: ${response.statusCode}');
    }
  }
  Future<List<Inquiry>> loadInquiry(userId) async {
    http.Response response = await http.get(Uri.parse("${CustomUrl.url}/mypage/inquiry/$userId"));
    if(response.statusCode == 200){
      print("OK");
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      return body.map<Inquiry>((item) => Inquiry.fromJson(item)).toList();
    }else{
      print("NG");
      throw Exception('Failed to load Donation Data');
    }
  }


}


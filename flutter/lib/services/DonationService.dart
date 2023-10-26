import 'dart:convert';

import 'package:givoo/component/model/com_dnt_type_model.dart';
import 'package:http/http.dart' as http;

import '../component/model/com_dnthistory_model.dart';
import '../config/custom_url.dart';

class DonationService{

  Future<List<Donation>> loadDonation(userId) async {
    http.Response response = await http.get(Uri.parse("${CustomUrl.url}/mypage/dntresult/$userId"));
    print(response.bodyBytes);
    try {
      if(response.statusCode == 200){
        List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
          return body.map<Donation>((item) => Donation.fromJson(item)).toList();
      }else{
        print("NG");
        throw Exception('Failed to load Donation Data');
      }
    } on Exception catch (e) {
      print('(DonationService.dart) Donation List is maybe Empty => $e');
      return List.empty();
    }
  }

  Future<List<DonationType>?> loadDonationType(orgId) async {
    http.Response response = await http.get(Uri.parse("${CustomUrl.url}/donation/$orgId"));
    if(response.body.isNotEmpty) {
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
        return body.map<DonationType>((item) => DonationType.fromJson(item))
            .toList();
      } else {
        print("NG");
        throw Exception('Failed to load Donation Data');
      }
    } else {
    }
    return null;
  }
  Future<void> sendDonation(userId,orgId,dntAmount,orgName) async {
    final url = Uri.parse("${CustomUrl.url}/donation/send");  // 서버의 URL로 변경하세요.
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'userId': userId,
        'orgId': orgId,
        'dntAmount' :dntAmount,
        'orgName':orgName,
      }),
    );
    if (response.statusCode == 200) {
      print('요청이 성공했습니다.');
    } else {
      print('요청이 실패했습니다. 에러 코드: ${response.statusCode}');
    }
  }


}
import 'dart:convert';

import 'package:givoo/component/model/com_dnt_type_model.dart';
import 'package:http/http.dart' as http;

import '../component/model/com_dnthistory_model.dart';
import '../config/custom_url.dart';

class DonationService{

  Future<List<Donation>> loadDonation(userId) async {
    http.Response response = await http.get(Uri.parse("${CustomUrl.url}/mypage/dntresult/$userId"));
    if(response.statusCode == 200){
      print("OK");
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      return body.map<Donation>((item) => Donation.fromJson(item)).toList();
    }else{
      print("NG");
      throw Exception('Failed to load Donation Data');
    }
  }

  Future<List<DonationType>?> loadDonationType(orgId) async {
    http.Response response = await http.get(Uri.parse("${CustomUrl.url}/donation/$orgId"));
        print('(DonationService) response.body == ${response.body}');
    if(response.body.isNotEmpty) {
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
        print('(DonationService)loadDonationType == \n$body');
        return body.map<DonationType>((item) => DonationType.fromJson(item))
            .toList();
      } else {
        print("NG");
        throw Exception('Failed to load Donation Data');
      }
    } else {
    }
  }
}
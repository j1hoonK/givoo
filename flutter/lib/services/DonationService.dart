import 'dart:convert';

import 'package:givoo/config/url.dart';
import 'package:http/http.dart' as http;

import '../component/model/com_dnthistory_model.dart';

class DonationService{
  final int userId;
  DonationService(this.userId);

  Future<List<Donation>> loadDonation() async {
    http.Response response = await http.get(Uri.parse("http://${Url.url}:1000/mypage/dntresult/$userId"));
    if(response.statusCode == 200){
      print("OK");
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      return body.map<Donation>((item) => Donation.fromJson(item)).toList();
    }else{
      print("NG");
      throw Exception('Failed to load Donation Data');
    }
  }
}
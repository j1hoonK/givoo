import 'dart:convert';

import '../config/custom_url.dart';
import '../pages/organization_info/model/org_notice_model.dart';
import 'package:http/http.dart' as http;

class OrganizationNoticeService{
  // 기관 공지 조회
  Future<List<OrgNoticeModel>> readOrgNotice(orgId) async {
    try {
      var response = await http.get(Uri.parse("${CustomUrl.url}/org/notice/$orgId"));
      List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      List<OrgNoticeModel> result =
      data.map((e) => OrgNoticeModel.fromJson(e)).toList();
      return result;
    } catch (error) {
      print('OrgNotice_ error: $error');
      throw Exception('Failed to load todo');
    }
  }
}
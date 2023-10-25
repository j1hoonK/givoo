import 'package:flutter/cupertino.dart';
import 'package:givoo/services/organization_notice.dart';

import '../pages/organization_info/model/org_notice_model.dart';

class OrgNoticeProvider with ChangeNotifier{
  OrganizationNoticeService organizationNoticeService = OrganizationNoticeService();

  List<OrgNoticeModel> _orgNoticeList = [];

  get orgNoticeList => _orgNoticeList;



  Future<void> loadOrgNotice(orgId) async {
    List<OrgNoticeModel> orgNoticeData = await organizationNoticeService.readOrgNotice(orgId);
    print('orgNoticeData(prv) == $orgNoticeData');
    _orgNoticeList = orgNoticeData;
    notifyListeners();
  }
}
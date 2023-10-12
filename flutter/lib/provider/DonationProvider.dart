import 'package:flutter/cupertino.dart';
import 'package:givoo/component/model/com_dnt_type_model.dart';
import 'package:givoo/services/DonationService.dart';
import '../component/model/com_dnthistory_model.dart';

class DonationProvider with ChangeNotifier{
  final DonationService _donationService = DonationService();
  List<Donation> _donation = [];
  List<Donation> get donation => _donation;

  List<DonationType> _typeInfo = [];
  List<DonationType> get typeInfo => _typeInfo;

  // 후원 이력 확인
  loadDonation() async {
    List<Donation> donationList = await _donationService.loadDonation(1);
    _donation = donationList;
    notifyListeners();
  }

  loadDonationType(orgid) async {
    List<DonationType>? typeList = await _donationService.loadDonationType(orgid);
    print('TypeList@@ == ${typeList.toString()}');
    if(typeList == 'null') {
      return ;
    } else {
      _typeInfo = typeList!;
      notifyListeners();
    }
  }
}
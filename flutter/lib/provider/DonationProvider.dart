
import 'package:flutter/material.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';
import 'package:givoo/component/model/com_dnt_type_model.dart';
import 'package:givoo/services/DonationService.dart';

class DonationProvider with ChangeNotifier {
  final DonationService _donationService = DonationService();
  List<Donation> _donation = [];

 static var _totalAmount =0;
 static get totalAmount=>_totalAmount;
  List<Donation> get donation => _donation;

  List<DonationType> _typeInfo = [];

  List<DonationType> get typeInfo => _typeInfo;

  // 후원 이력 확인
  Future<void> loadDonation() async {
    try {
      List<Donation> donationList = await _donationService.loadDonation(1);
      _donation = donationList;
      notifyListeners();
    } catch (error) {
      print('Error loading donation: $error');
    }
  }

  Future<void> loadDonationType(orgid) async {
    _typeInfo = [];
    try {
      List<DonationType>? typeList =
      await _donationService.loadDonationType(orgid);
      print('TypeList == $typeList');
      if (typeList == null) {
        print('null process');
      } else {
        _typeInfo = typeList;
        notifyListeners();
      }
    } catch (error) {
      print('Error loading donation type: $error');
    }
  }
}
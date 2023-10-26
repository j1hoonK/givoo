
import 'package:flutter/material.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';
import 'package:givoo/component/model/com_dnt_type_model.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/services/DonationService.dart';

class DonationProvider with ChangeNotifier {
  final DonationService _donationService = DonationService();
  List<Donation> _donation = [];
  List<Donation> selectedDonations = []; // 선택된 카드를 저장할 Set
  final String donationKey="imp34145614";
 static List<Donation> selectedDonations2 = [];
 static var _totalAmount =0;
 static get totalAmount=>_totalAmount;
  List<Donation> get donation => _donation;

  List<DonationType> _typeInfo = [];

  List<DonationType> get typeInfo => _typeInfo;

  // 후원 이력 확인
  Future<void> loadDonation(String userId) async {
    try {
      List<Donation> donationList = await _donationService.loadDonation(userId);
        _totalAmount = 0;
        print(donationList);
      if(donationList.isNotEmpty) {
        _donation = donationList;
        for (var donation in _donation) {
          int donationAmount = donation.dntAmount;
          _totalAmount += donationAmount;
        }
        notifyListeners();
      }
      print(_totalAmount);
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


  void toggleSelection(Donation dnt) {
    if (selectedDonations.contains(dnt)) {
      selectedDonations.remove(dnt); // 선택 해제
    } else {
      selectedDonations.add(dnt); // 선택
    }
    selectedDonations2 = selectedDonations;
    notifyListeners();
  }
  Future<void> sendDonation(userId, orgId,dntAmount,orgName) async {
    await _donationService.sendDonation(userId, orgId, dntAmount,orgName);
  }

}
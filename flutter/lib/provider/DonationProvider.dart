import 'package:flutter/cupertino.dart';
import 'package:givoo/services/DonationService.dart';
import '../component/model/com_dnthistory_model.dart';

class DonationProvider with ChangeNotifier{
  final DonationService _donationService = DonationService(1);
  List<Donation> _donation = [];
  List<Donation> get donation => _donation;

  loadDonation() async {
    List<Donation> donationList = await _donationService.loadDonation();
    _donation = donationList;
    notifyListeners();
  }
}
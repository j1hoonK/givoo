import 'package:flutter/material.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:provider/provider.dart';
import '../../../component/view/appbar.dart';
import '../../../component/view/com_dnthistory_view.dart';

class DonationHistory extends StatefulWidget {
  const DonationHistory({super.key});

  @override
  State<DonationHistory> createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  @override
  void initState() {
    super.initState();
    Provider.of<DonationProvider>(context, listen: false).loadDonation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        title: '기부 이력 확인',
      ),
      body: Consumer<DonationProvider>(builder: (context, provider, child) {
        if (provider.donation.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return DntHistory(dnt: provider.donation[index]);
            },
            itemCount: provider.donation.length,
          );
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "데이터 조회 실패",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                ),
              ),
            ],
          ));
        }
      }),
    );
  }
}

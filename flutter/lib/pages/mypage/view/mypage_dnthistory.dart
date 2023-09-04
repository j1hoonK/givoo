import 'package:flutter/material.dart';
import '../../../component/view/appbar.dart';
import '../../../component/view/com_dnthistory_view.dart';

class DonationHistory extends StatelessWidget {
  const DonationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
          title: '기부 이력 확인',
      ),
      body: DntHistory(date: "date", type: "type", name: "name", text: Text("data"), /*text4: "amount"*/),
    );
  }
}

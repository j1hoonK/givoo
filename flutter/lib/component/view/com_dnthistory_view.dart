import 'package:flutter/material.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';
import 'package:intl/intl.dart';

class DntHistory extends StatelessWidget {
  const DntHistory({super.key, required this.dnt});

  final Donation dnt;

  @override
  Widget build(BuildContext context) {

    final dateForm = DateFormat('yyyy-MM-dd').format(dnt.dntDate);
    final orgIdForm = dnt.orgId.toString();
    final amountForm = dnt.dntAmount.toString();

    return TextButton(
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
            Row(
                children: [
                  Text("결제 완료"),
                  SizedBox(width: 20,),
                  Text(dateForm),
                ]
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dnt.dntType),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(orgIdForm),
                      Text(amountForm),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.grey[350],
            )
          ],
        ),
      ),
    );
  }
}

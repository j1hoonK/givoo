import 'package:flutter/material.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';
import 'package:givoo/config/palette.dart';
import 'package:intl/intl.dart';

class DntHistory extends StatelessWidget {
  const DntHistory({super.key, required this.dnt});

  final Donation dnt;

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;

    final dateForm = DateFormat('yyyy-MM-dd').format(dnt.dntDate);
    final orgIdForm = dnt.orgId.toString();
    final amountForm = dnt.dntAmount.toString();

    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                "결제 완료",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Palette.textColor1),
              ),
              SizedBox(
                width: mSize * 2,
              ),
              Text(dateForm, style: TextStyle(color: Palette.textColor2)),
            ]),
            SizedBox(
              height: mHeight * 0.3,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dnt.dntType,
                      style: TextStyle(color: Palette.textColor2)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orgIdForm,
                        style: TextStyle(color: Palette.textColor1),
                      ),
                      Text(
                        "$amountForm 원",
                        style: TextStyle(color: Palette.textColor1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

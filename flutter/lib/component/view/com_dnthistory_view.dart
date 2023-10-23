import 'package:flutter/material.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';
import 'package:givoo/config/palette.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DntHistory extends StatelessWidget {
  const DntHistory({super.key, required this.dnt});

  final Donation dnt;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    final dateForm = DateFormat('yyyy-MM-dd').format(dnt.dntDate);
    final orgIdForm = dnt.orgId.toString();
    final amountForm = dnt.dntAmount.toString();
    final provider = Provider.of<DonationProvider>(context);
    return Container(
      child: Card(
        color: provider.selectedDonations.contains(dnt) ? Colors.grey : Colors.white,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(dateForm, style: TextStyle(color: Palette.textColor2)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("${NumberFormat.currency(symbol:"",locale: 'ko_KR').format(dnt.dntAmount)} 원",
                      style: TextStyle(
                      color: Color(0xFF32D4AE)
                    ),
                    ),SizedBox(
                      height: 10,
                    ),
                    Text(dnt.dntType,style: TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.grey,
                      fontSize: 12
                    ),),SizedBox(
                      height: 5,
                    ),
                    Text(dnt.orgName,style: TextStyle(
                        fontWeight: FontWeight.bold,

                    ),),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}

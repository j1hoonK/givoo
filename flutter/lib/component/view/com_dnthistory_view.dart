import 'package:flutter/material.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';
import 'package:givoo/config/palette.dart';
import 'package:intl/intl.dart';

class DntHistory extends StatelessWidget {
  const DntHistory({super.key, required this.dnt, required this.isChecked});

  final Donation dnt;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final dateForm = DateFormat('yyyy-MM-dd').format(dnt.dntDate);

    return TextButton(
      onPressed: () {},
      child: Container(
        //height: height*0.15,
        child: Card(
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



            /*    SizedBox(
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
                            dnt.orgName,
                            style: TextStyle(color: Palette.textColor1),
                          ),
                          Text(
                            "${NumberFormat.currency(symbol:"",locale: 'ko_KR').format(int.parse(amountForm))}원",
                            style: TextStyle(color: Palette.textColor1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

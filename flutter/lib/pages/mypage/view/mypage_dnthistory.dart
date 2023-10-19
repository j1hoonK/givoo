import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../component/view/appbar.dart';
import '../../../component/view/com_dnthistory_view.dart';
import '../../../config/palette.dart';

class DonationHistory extends StatefulWidget {
  const DonationHistory({super.key});

  @override
  State<DonationHistory> createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  @override
  void initState() {
    super.initState();
    Provider.of<DonationProvider>(context, listen: false).loadDonation(LoginViewModel.userId);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: BaseAppbar(title: "기부내역",
          //title: '기부 이력 확인',
          ),
      body: Consumer<DonationProvider>(builder: (context, provider, child) {
        if (provider.donation.isNotEmpty) {
          return Container(color: Color(0xFFF7F7F8),
            child: Column(
              children: [
                Container(
                  height:height*0.08,
                  color: Color(0xFFF95835),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10,0,10,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Row(
                         children: [
                           Icon(CupertinoIcons.heart_fill,color: Colors.red,)
                           ,Text("나의 기부금액",style: TextStyle(color: Color(0xFFFD9DBE0)),)
                         ],
                       ),Text("${NumberFormat.currency(symbol:"",locale: 'ko_KR').format(DonationProvider.totalAmount)} 원",style: TextStyle(
                          color: Colors.white,fontSize: 20
                        ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return DntHistory(dnt: provider.donation[index]);
                    },
                    itemCount: provider.donation.length,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/person.png'),
                    ),
                  ),
                ),
                Text(
                  "기부 이력이 없습니다.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                TextButton(
                    onPressed: () {
                      context.go('/main');
                    },
                    child: Text(
                      '기부하러 가기',
                      style: TextStyle(color: Palette.mainColor),
                    ))
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: Container(
        color: Color(0xFFF7F7F8),
        height: height*0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height*0.08,
                child: ElevatedButton(onPressed: (){
                  context.push("/mypage/dntbillsend");

                }, child: Text("기부금 영수증 다운받기"))),
            Container(
                height: height*0.08,
                child: ElevatedButton(onPressed: (){
                  context.push("/mypage/dntbillrequest");

                }, child: Text("전자기부금영수증 신청"),
                    style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.red,)
                ),
            ),
          ],
        ),
      ),
    );
  }
}

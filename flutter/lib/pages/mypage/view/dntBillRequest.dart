import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/userInfo.dart';

class DntBillRequest extends StatelessWidget {
  const DntBillRequest({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: BaseAppbar(title: "기부금 영수증 전송",),
      body: SingleChildScrollView(child: Column(
        children: [
          UserInfo(),
          Container(
            height: height*0.08,
            width: width,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(onPressed: (){



            }, child: Text("전자기부금영수증 신청하기",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,
            ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0xFF457515),)
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/main_mygroup_detail_image.dart';
import 'package:givoo/component/view/userInfo.dart';


class DntBillSend extends StatelessWidget {
  DntBillSend ({super.key});

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
             }, child: Text("기부영수증 팩스전송",style: TextStyle(
               color: Colors.white,fontWeight: FontWeight.bold,
             ),),
                 style: ElevatedButton.styleFrom(
                   backgroundColor:Color(0xFF457515),)
             ),
           ), Container(
             height: height*0.08,
             width: width,
             margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
             child: ElevatedButton(onPressed: (){
             }, child: Text("기부금 영수증 이메일 전송",style: TextStyle(
               color: Colors.white,fontWeight: FontWeight.bold,
             ),),
                 style: ElevatedButton.styleFrom(
                   backgroundColor:Color(0xFF457515),)
             ),
           ),
         ],
       )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/pages/mypage/view/inquiryPage.dart';
import 'package:givoo/pages/mypage/view/q&a_page.dart';
import 'package:givoo/provider/InquiryProvider.dart';
import 'package:provider/provider.dart';

class Inquiry extends StatelessWidget {
  const Inquiry({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: BaseAppbar(title: "문의하기",),
      body: Consumer<InquiryProvider>(
        builder:(context,provider,child){
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.black,
                  tabs: [
                  Tab(text: '1:1 문의'),
                  Tab(text: '문의 사항 확인'),
                ],
                ),Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      InquiryPage(),
                      QNA(),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      )

    );

  }
}

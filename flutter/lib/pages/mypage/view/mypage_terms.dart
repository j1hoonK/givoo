import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/pages/mypage/view/privacy_policy.dart';
import 'package:givoo/pages/mypage/view/terms_condition.dart';
import 'package:go_router/go_router.dart';

class Mypage_terms extends StatelessWidget {
  const Mypage_terms({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
          appBar: BaseAppbar(title:"약관/정책"),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(text:'이용약관'),
                    Tab(text:'개인정보처리방침'),
                  ],
                ),Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      TermsCondition(),
                      PrivacyPolicy(),
                    ],
                  ),
                )
              ],
            ),
          )

      );


  }
}



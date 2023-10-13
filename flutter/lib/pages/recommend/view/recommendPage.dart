import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/RecommendMoreProvider.dart';
import 'package:provider/provider.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({super.key, required this.orgType});
  final orgType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(title:orgType),   // 저기 타이틀 종교단체 변수로 받아와야합니당
      body: Consumer<RecommendMoreProvider>(
        builder: (context, provider, child) {
          return provider.orgImageMap.isEmpty ?Center(child: CircularProgressIndicator()) :Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "총 ${provider.orgList.length}개의 단체",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 550,
                  child: GridView.builder(
                      itemCount: provider.orgList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        childAspectRatio: 1 / 1.4, //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 10, //수평 Padding
                      ),
                      itemBuilder: (BuildContext context, int idx) {
                        print("${provider.orgList.length}");
                        return
                          OrgBox(
                          orgName: provider.orgList[idx].orgName,
                          orgAddress: provider.orgList[idx].orgAddress,
                          imagePath: provider.orgImageMap.containsKey(provider.orgList[idx].orgId)
                              ?
                          provider.orgImageMap[provider.orgList[idx].orgId]
                              :
                          "https://givoo-org-image.s3.ap-northeast-2.amazonaws.com/mainlogo.png"
                          , orgId: provider.orgList[idx].orgId,
                        );
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

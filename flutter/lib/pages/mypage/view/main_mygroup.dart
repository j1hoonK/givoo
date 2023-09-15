import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/noOrgList.dart';
import 'package:givoo/component/view/orgList.dart';
import 'package:givoo/pages/mypage/view/mypage.dart';
import 'package:givoo/provider/MyPageProvider.dart';
import 'package:givoo/provider/UserProvider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
class MainMyGroup extends StatefulWidget {
  const MainMyGroup({Key? key});

  @override
  State<MainMyGroup> createState() => _MainMyGroupState();
}

class _MainMyGroupState extends State<MainMyGroup> {
  @override
  void initState(){
    super.initState();
    Provider.of<MyPageProvider>(context, listen: false).fetchTodo(1);
    Provider.of<UserInfoProvider>(context, listen: false).loadUserInfo();


  }

  @override
  Widget build(BuildContext context) {
    final userInf = Provider.of<UserInfoProvider>(context);
    print("bbbbbbbbbbbbbbb========${userInf.kakaoUser[0].userName}");
    //final myPageProvider = Provider.of<MyPageProvider>(context);
    return Scaffold(
      appBar: BaseAppbar(title: "내 단체"), // BaseAppbar가 어디에 정의되었는지 확인
      body: Column(
        children: [
          Consumer<MyPageProvider>(
            builder: (context, myPageProvider, child) {
              if (!myPageProvider.myOrgList.isEmpty) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.all(0),
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 10),
                      itemCount: myPageProvider.orgTypes.length,
                      itemBuilder: (BuildContext ctx, int idx) {
                        return Card(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  myPageProvider.orgTypes[idx],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              GridView.builder(
                                itemCount: myPageProvider.myOrgList2[idx].length, //item 개수
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                                  //  childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
                                  mainAxisSpacing: 10, //수평 Padding
                                  crossAxisSpacing: 10, //수직 Padding
                                ),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext ctx2, int idx2) {
                                  return OrgBox(orgName: myPageProvider.myOrgList2[idx][idx2].orgName,
                                      orgAddress: myPageProvider.myOrgList2[idx][idx2].orgAddress,
                                      imagePath: myPageProvider.myOrgList2[idx][idx2].imagePath, orgId: myPageProvider.myOrgList2[idx][idx2].orgId,);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return noOrgList();
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/noOrgList.dart';
import 'package:givoo/component/view/orgList.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/MyPageProvider.dart';
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
    Provider.of<MyPageProvider>(context, listen: false).fetchTodo(int.parse(LoginViewModel.userId));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppbar(
      ), // BaseAppbar가 어디에 정의되었는지 확인
      body: Column(
        children: [
          Consumer<MyPageProvider>(
            builder: (context, myPageProvider, child) {
              if (!myPageProvider.myOrgList.isEmpty) {
                return myPageProvider.myOrgList2.isNotEmpty ? Expanded(
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
                              ListView.builder(
                                itemCount: myPageProvider.myOrgList2[idx].length, //item 개수
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext ctx2, int idx2) {
                                  return OrgList(orgName: myPageProvider.myOrgList2[idx][idx2].orgName,
                                      orgAddress: myPageProvider.myOrgList2[idx][idx2].orgAddress,
                                      imagePath: myPageProvider.myOrgList2[idx][idx2].imagePath ?? "https://givoo-org-image.s3.ap-northeast-2.amazonaws.com/mainlogo.png"
                                      , orgId: myPageProvider.myOrgList2[idx][idx2].orgId);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ) : Container(
                    height: height*0.8,
                    child: Center(child: CircularProgressIndicator()));
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

import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/component/view/noOrgList.dart';
import 'package:givoo/component/view/orgList.dart';
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
    Provider.of<MyPageProvider>(context, listen: false).fetchTodo();

  }

  @override
  Widget build(BuildContext context) {
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
                                margin: EdgeInsets.all(15),
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
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: myPageProvider.myOrgList2[idx].length,
                                itemBuilder: (BuildContext ctx2, int idx2) {
                                  return OrgList(
                                    myOrgList:myPageProvider.myOrgList2[idx][idx2] ,
                                  );
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

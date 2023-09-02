import 'package:flutter/material.dart';
import 'package:givoo/component/appbar.dart';
import 'package:givoo/component/noOrgList.dart';
import 'package:givoo/component/orgList.dart';
import 'package:givoo/provider/MyPageProvider.dart';
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
    final myPageProvider = Provider.of<MyPageProvider>(context);
    return Scaffold(
      appBar: BaseAppbar(title: "내 단체"), // BaseAppbar가 어디에 정의되었는지 확인
      body: Column(
        children: [
          Consumer<MyPageProvider>(
            builder: (context, myPageProvider, child) {
              if (myPageProvider.myOrgList != null) {
                return Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: myPageProvider.orgTypes.length,
                      itemBuilder: (BuildContext ctx, int idx) {
                        return Card(
                          margin: EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  myPageProvider.orgTypes[idx],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: myPageProvider.myOrgList2[idx].length,
                                itemBuilder: (BuildContext ctx2, int idx2) {
                                  return OrgList(
                                    myPageProvider.myOrgList2[idx][idx2],
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
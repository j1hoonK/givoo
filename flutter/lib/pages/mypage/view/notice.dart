import 'package:flutter/material.dart';
import 'package:givoo/provider/MyPageProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:provider/provider.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticeModel = Provider.of<MyPageProvider>(context);

    return Scaffold(
      appBar: BaseAppbar(title: "공지사항",),
      body: Consumer<MyPageProvider>(builder: (context,provider,child){
        return
          SingleChildScrollView(
            child: Container(
              height:
              600,
              child: ListView.builder(
              itemCount: provider.noticeList.length,
                itemBuilder:(context,idx){
                return ExpansionPanelList(
                    elevation: 1, // 그림자 효과
                    expandedHeaderPadding: EdgeInsets.all(0),
                    expansionCallback: (int index, bool isExpanded) {
                     provider.toggleIsExpanded(idx);
                    },
                    children:[ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                provider.noticeList[idx].noticeSubject, // 제목을 여기에 넣으세요
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                provider.noticeList[idx].noticeDate, // 날짜를 여기에 넣으세요
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      body: Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          provider.noticeList[idx].noticeBody, // 공지 내용을 여기에 넣으세요
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      isExpanded:provider.noticeList[idx].isExpanded,
                    )
                    ]
                );

                },
              ),
            ),
          );
      },)
    );
  }
}

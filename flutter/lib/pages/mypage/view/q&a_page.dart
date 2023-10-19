import 'package:flutter/material.dart';
import 'package:givoo/provider/InquiryProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class QNA extends StatelessWidget {
  const QNA({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Consumer<InquiryProvider>(
          builder: (context, provider,child) {
            return Container(
              height: height*0.8,
              child: ListView.builder(
                  itemCount: provider.inquiryList.length,
                  itemBuilder:(context,idx){
                    return InkWell(
                      onTap: (){
                        context.push("/mypage/inquiry/$idx");
                      },
                      child: Container(
                        height: height*0.1,
                        width: width,
                        margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                        child: Column(
                          children: [Container(
                            alignment: Alignment.topLeft,
                              child: Text(provider.inquiryList[idx].title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(provider.inquiryList[idx].createdAt,style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey
                                ),),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    border: Border.all(
                                      color:provider.inquiryList[idx].status=="0" ? Colors.grey : Color(0xFFF95835),  // 원하는 테두리 색을 여기에 지정
                                      width: 2.0,          // 테두리의 두께
                                    ),
                                  ),
                                  child:provider.inquiryList[idx].status=="0" ? Text("답변대기",style: TextStyle(
                                    color: Colors.black,fontSize: 12
                                  ),
                                  ): Text("답변완료",style: TextStyle(
                                      color:Color(0xFFF95835),fontSize: 12
                                  ),),
                                )
                              ],
                            ),Divider(),

                          ],
                        ),
                      ),
                    );

              }),
            );
          }
        ),

    );
  }
}


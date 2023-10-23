import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/InquiryProvider.dart';
import 'package:provider/provider.dart';

class InquiryDetail extends StatelessWidget {
  InquiryDetail({super.key, required this.idx});
  final int idx;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: BaseAppbar(
          title: "문의하기",
        ),
        body: Consumer<InquiryProvider>(builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Container(
              height: height *0.8,
              width: width,
              margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        provider.inquiryList[idx].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        provider.inquiryList[idx].createdAt,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(
                            color: provider.inquiryList[idx].status == "0"
                                ? Colors.grey
                                : Color(0xFFF95835), // 원하는 테두리 색을 여기에 지정
                            width: 2.0, // 테두리의 두께
                          ),
                        ),
                        child: provider.inquiryList[idx].status == "0"
                            ? Text(
                                "답변대기",
                                style:
                                    TextStyle(color: Colors.black, fontSize: 12),
                              )
                            : Text(
                                "답변완료",
                                style: TextStyle(
                                    color: Color(0xFFF95835), fontSize: 12),
                              ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(20),
                    child: Text(provider.inquiryList[idx].content,style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ),Divider(),
                  SizedBox(
                    height: 15,
                  ),provider.inquiryList[idx].answerCreated!=null?
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: width,
                        child: Container(
                          alignment: Alignment.center,
                          height: height*0.04,
                          width: width*0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFFFCF4EF),
                          ),
                          child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("관리자",style: TextStyle(
                                  color: Color(0xFFF95835)
                                ),),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("${provider.inquiryList[idx].answerCreated}",style: TextStyle(
                                  color: Colors.grey,fontSize: 12
                                ),),
                              ],
                            ),
                        ),
                      ), Container(
                        padding: EdgeInsets.all(20),
                        height: height*0.35,
                        width: width,
                        child:Text("${provider.inquiryList[idx].answer}",style: TextStyle(
                          color: Colors.grey,),
                        ),
                      ),
                    ],
                  ) : Container(),

                ],
              ),
            ),
          );
        }));
  }
}

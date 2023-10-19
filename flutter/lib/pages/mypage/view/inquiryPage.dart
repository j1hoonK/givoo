import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/InquiryProvider.dart';
import 'package:provider/provider.dart';

class InquiryPage extends StatelessWidget {
   InquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Consumer<InquiryProvider>(builder: (context,provider,child){
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                      "제목"
                  ),
                ),
                Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '제목은 필수 항목입니다.';
                          }

                        },
                        cursorColor: Colors.black,
                        decoration:
                        InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Color(0xFFD9DBE0)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color:Color(0xFFD9DBE0)),
                            ),
                            hintText: "문의제목을 입력해주세요.",
                            filled: true,
                            fillColor: Color(0xFFD9DBE0)

                        ),
                        onChanged: (value) {
                          provider.updateTitle(value);
                        },
                      ), SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                            "내용 작성"
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '문의 내용은 필수 항목입니다.';
                          }
                        },
                        cursorColor: Colors.black,
                        decoration:

                        InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xFFD9DBE0)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color:Color(0xFFD9DBE0)),
                          ),
                          hintText: "문의내용을 입력해주세요.",
                          filled: true,
                          border: OutlineInputBorder(),
                          fillColor: Color(0xFFD9DBE0),
                        ),
                        maxLines: 8,
                        onChanged: (value) {
                          provider.updateContent(value);
                        },
                      ),
                      SizedBox(height: 70),
                      Container(
                        height: height*0.08,
                        width: width,
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (provider.formKey.currentState!.validate()) {
                                provider.sendInquiry(provider.title, provider.content, LoginViewModel.userId).then((value) =>
                                    Provider.of<InquiryProvider>(context, listen: false).loadInquiry()
                                );
                              }
                            },
                            child: Text('문의하기'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF95835),)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },);
  }
}

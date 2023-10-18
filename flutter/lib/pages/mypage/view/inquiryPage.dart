import 'package:flutter/material.dart';
import 'package:givoo/provider/InquiryProvider.dart';
import 'package:provider/provider.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Consumer<InquiryProvider>(builder: (context,provider,child){
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.topLeft,
                child: Text(
                    "제목"
                ),
              ),
              TextFormField(
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
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                    "내용 작성"
                ),
              ),
              TextFormField(
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
                      // 폼이 유효성 검사를 하려면 추가로 구현해야합니다.
                      // 폼이 유효하면 formModel.title 및 formModel.content를 사용할 수 있습니다.
                      print('제목: ${provider.title}');
                      print('내용: ${provider.content}');
                    },
                    child: Text('문의하기'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF95835),)
                ),
              ),
            ],
          ),
        ),
      );
    },);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givoo/provider/DropDownProvider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
class UserInfo extends StatelessWidget {
  UserInfo({super.key, required this.name, required this.resiNumber});

  var name;
  var resiNumber;

  @override
  Widget build(BuildContext context) {
    String noitce =
        "회원님의 이름 및 개인정보가 다르거나, 기부내역이 다른 경우 회원상담센터 1544-7777로 연락주시기 바랍니다.";
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xFFF7F7F8),
      child: Column(
        children: [
          Container(
            color: Color(0xFFDADADA),
            height: height * 0.08,
            alignment: Alignment.center,
            child: Text(
              "회원정보",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.07,
                width: width * 0.5,
                child: Text("성명"),
              ),
              Container(
                alignment: Alignment.center,
                height: height * 0.1,
                width: width * 0.5,
                child: Text(name),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.07,
                width: width * 0.5,
                child: Text("주민등록번호"),
              ),
              Container(
                alignment: Alignment.center,
                height: height * 0.1,
                width: width * 0.5,
                child: Text(resiNumber),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: height * 0.07,
                width: width * 0.5,
                child: Text("영수증발급년도"),
              ),
              Consumer<DropdownProvider>(builder: (context,provider,child){
                return Container(
                  width: width*0.5,
                  alignment: Alignment.topRight,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      items: provider.options
                          .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: provider.selectedOption,
                      onChanged: (String? value) {

                        provider.setSelectedOption(value);
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 150,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
          Divider(),
          Container(
            height: height * 0.08,
            width: width,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "기부 내역 확인하기",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            // alignment: Alignment.center,
            height: height * 0.2,
            width: width,
            color: Color(0xFFE1FCC0),
            child: Text(
              noitce,
              style: TextStyle(
                fontSize: 18,
                height: 2.2,
              ),
            ),
          )
        ],
      ),
    );
  }

}

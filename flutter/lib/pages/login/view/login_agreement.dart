import 'package:flutter/material.dart';
import 'package:givoo/pages/login/view/login_first.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool allAgreed = false;
  bool allA = false;
  bool allB = false;
  bool allC = false; // "모두 동의합니다" 체크 상태
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double mHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mHeight * 0.05),
          Center(
            child: Text(
              '이용약관',
              style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFFFF466E),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: mHeight * 0.015), // 간격 추가

          // 체크박스 및 텍스트 입력란 추가
          Column(
            children: [
              ListTile(
                leading: Checkbox(
                  value: allAgreed, // "모두 동의합니다" 체크 상태 설정
                  onChanged: (bool? value) {
                    setState(() {
                      allAgreed = value ?? false;
                      allA = allAgreed;
                      allB = allAgreed;
                      allC = allAgreed; // 체크 상태 업데이트
                    });
                  },
                  activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                  checkColor: Colors.white,
                ),
                title: Text(
                  '모두 동의합니다',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              Divider(
                thickness: 2,
                height: 1,
                indent: 1,
                //왼쪽 간격 조정
                endIndent: 15,
                //오른쪽 간격 조정
                color: Colors.grey,
              ), //회색 실선
              ListTile(
                leading: Checkbox(
                  value: allA, // 체크 상태 설정
                  onChanged: (bool? value) {
                    allA == false && allB == true && allC == true
                        ? setState(() {
                            allAgreed = true;
                            allA = value ?? false;
                          })
                        : setState(() {
                            allA = value ?? false;
                          });
                  },
                  activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                  checkColor: Colors.white,
                ),
                title: Text(
                  '만 14세 이상입니다',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: Checkbox(
                  value: allB, // 체크 상태 설정
                  onChanged: (bool? value) {
                    allA == true && allB == false && allC == true
                        ? setState(() {
                            allAgreed = true;
                            allB = value ?? false;
                          })
                        : setState(() {
                            allB = value ?? false;
                          });
                  },
                  activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                  checkColor: Colors.white,
                ),
                title: Text(
                  '[필수] 기부어때 이용약관 동의',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: Checkbox(
                  value: allC, // 체크 상태 설정
                  onChanged: (bool? value) {
                    allA == true && allB == true && allC == false
                        ? setState(() {
                            allAgreed = true;
                            allC = value ?? false;
                          })
                        : setState(() {
                            allC = value ?? false;
                          });
                  },
                  activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                  checkColor: Colors.white,
                ),
                title: Text(
                  '[필수] 기부어때 이용약관 동의',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
          SizedBox(
            height: mHeight * 0.02,
          ),
          Container(
            width: double.infinity,
            height: mHeight * 0.08,
            color: (allB && allC) || (!allA && !allB && !allC)
                ? Color(0xFFFF466E)
                : Colors.grey, // 버튼 활성/비활성 상태에 따라 색상 변경

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF466E),
              ),
              onPressed: (allB == true && allC == true) ||
                      (allB == true && allC == true && allC == true)
                  ? () async {
                      if (_formKey.currentState!.validate()) {
                        // validation 이 성공하면 true 가 리턴
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('완료'),
                          action: SnackBarAction(label: "닫기", onPressed: () {}),
                        ));
                        _formKey.currentState!.save();
                      }
                    }
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('필수 약관을 모두 체크해주세요'),
                        action: SnackBarAction(label: "닫기", onPressed: () {}),
                      ));
                    },
              // allB와 allC가 모두 체크되어야 클릭 가능
              child: Text(
                "완료",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

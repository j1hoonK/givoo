import 'package:flutter/material.dart';




class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool allAgreed = false;
  bool allA = false;
  bool allB = false;
  bool allC = false; // "모두 동의합니다" 체크 상태

  @override
  Widget build(BuildContext context) {
    final double mHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.only(top: 90, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: '기부어때',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '약관동의',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFFFF466E),
                ),
              ),
              SizedBox(height: 40), // 간격 추가

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
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  SizedBox(height: 20),
                  Divider(
                    thickness: 2,
                    height: 1,
                    indent: 1, //왼쪽 간격 조정
                    endIndent: 15,//오른쪽 간격 조정
                    color: Colors.grey,
                  ), //회색 실선
                  ListTile(
                    leading: Checkbox(
                      value: allA, // 체크 상태 설정
                      onChanged: (bool? value) {
                        setState(() {
                          allA = value ?? false; // 체크 상태 업데이트
                        });
                        // 체크 상태 변경 시 동작
                      },
                      activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                      checkColor: Colors.white,
                    ),
                    title: Text(
                      '만 14세 이상입니다',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  ListTile(
                    leading: Checkbox(
                      value: allB, // 체크 상태 설정
                      onChanged: (bool? value) {
                        setState(() {
                          allB = value ?? false; // 체크 상태 업데이트
                        });
                        // 체크 상태 변경 시 동작
                      },
                      activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                      checkColor: Colors.white,
                    ),
                    title: Text(
                      '[필수] 기부어때 이용약관 동의',
                      style: TextStyle(
                        fontSize: 16,
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
                        setState(() {
                          allC = value ?? false; // 체크 상태 업데이트
                        });
                        // 체크 상태 변경 시 동작
                      },
                      activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                      checkColor: Colors.white,
                    ),
                    title: Text(
                      '[필수] 기부어때 이용약관 동의',
                      style: TextStyle(
                        fontSize: 16,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        color:  (allB && allC) || (!allA && !allB && !allC) ? Color(0xFFFF466E) : Colors.grey, // 버튼 활성/비활성 상태에 따라 색상 변경

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF466E),
          ),
          onPressed:
          (allB && allC) || (!allA && !allB && !allC) ? () {} : null, // allB와 allC가 모두 체크되어야 클릭 가능, 아무 것도 체크하지 않았을 때도 클릭 가능
          child: Text(
            "후원하기",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
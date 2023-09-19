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
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: mHeight * 0.03), // 간격 추가

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
    );


  }
}
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isFavorite = false; // 아이콘 상태를 나타내는 변수
  bool isGlobeSelected = false; // 'globe.png' 이미지 상태를 나타내는 변수
  bool isFollowSelected = false; // 'follow_n.png' 이미지 상태를 나타내는 변수

  // 아이콘을 토글(바꾸는)하는 함수
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // 현재 상태의 반대로 변경
    });
  }

  // 'globe.png' 이미지를 토글(바꾸는)하는 함수
  void toggleGlobe() {
    setState(() {
      isGlobeSelected = !isGlobeSelected; // 현재 상태의 반대로 변경
    });
  }

  // 'follow_n.png' 이미지를 토글(바꾸는)하는 함수
  void toggleFollow() {
    setState(() {
      isFollowSelected = !isFollowSelected; // 현재 상태의 반대로 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Container(
              width: 380,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                image: DecorationImage(
                  image: AssetImage('images/login/logo.png'), // 이미지 파일 경로
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(25.0),
                color: Colors.black12.withOpacity(0), // 투명도 설정
                child: Text(
                  '교회 이름',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 250,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    onPressed: () {
                      // 아이콘을 누를 때의 동작 (예: 언어 설정)
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      // 'globe.png' 이미지를 클릭했을 때의 동작
                      toggleGlobe(); // 이미지 상태 변경 함수 호출
                    },
                    child: Image.asset(
                      isGlobeSelected
                          ? 'images/group/globe.png' // 선택된 이미지 파일 경로(변화없음, 혹은 빈 globe)
                          : 'images/group/globe.png', // 일반 이미지 파일 경로
                      width: 24.0,
                      height: 24.0,
                      // 이미지 색상 설정 (선택 사항)
                    ),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      // 'follow_n.png' 이미지를 클릭했을 때의 동작
                      toggleFollow(); // 이미지 상태 변경 함수 호출
                    },
                    child: Image.asset(
                      isFollowSelected
                          ? 'images/group/follow_y.png' // 선택된 이미지 파일 경로
                          : 'images/group/follow_n.png', // 일반 이미지 파일 경로
                      width: 24.0,
                      height: 24.0,
                      // 이미지 색상 설정 (선택 사항)
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

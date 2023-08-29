import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:givoo/component/bottomnavbar.dart';

class ImageGraphCarousel extends StatelessWidget {
  final String imagePath;

  ImageGraphCarousel({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0), // '캐러셀에 들어간 이미지 자체' 를 둥글게 처리
          child: Image.asset(imagePath), // 이미지 위젯
        ),
        SizedBox(height: 30), // 이미지와 그래프 사이 여백
        // graphWidget: YourGraphWidget(),// 그래프 위젯만들기...?
      ],
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainPage> {
  //int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _buildMiddle(),
      bottomNavigationBar: BotNavBar(),
      /*BottomNavigationBar(//바텀 네비게이터
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.real_estate_agent),
            label: '기부추천',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),*/
    );
  }

  Widget _buildMiddle() {
    return
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,//왼쪽 정렬
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 30, 17, 9),
                child: Text(
                  '모금 추천...',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  //더보기 눌렀을 때 원하는 곳으로 이동
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: const [
                      Text(
                        '더 보기',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 240.0,
              aspectRatio: 0.5,//미디어 쿼리랑 같이 캐러셀 너비 조정?
              viewportFraction: 0.5,// 캐러셀 사이의 간격, 여백조정
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),// 캐러셀모서리를 둥글게, 이미지를 넣으면 직각으로 변함 따라서
                    ),
                    child: ImageGraphCarousel(
                      imagePath: 'images/login/logo.png',
                      // 그래프 위젯
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 22, 20, 12),
                    child: Text(
                      '자원봉사 추천',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      //더보기 아이콘 눌렀을 때 동작
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Row(
                        children: const [
                          Text(
                            '더 보기',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 240.0,
              aspectRatio: 1.5,
              viewportFraction: 0.5,
            ),
            items: [6, 7, 8, 9, 10].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0), //'캐러셀 슬라이더'를 둥글게 처리, 근데 이미지 넣으면 상단 부분이 직각이 되어버림.
                    ),
                    child: ImageGraphCarousel(
                      imagePath: 'images/login/logo.png',
                      // 그래프 위젯
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      );
  }
}
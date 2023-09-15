import 'package:flutter/material.dart';
import 'package:givoo/component/view/banner_image.dart';
import 'package:givoo/component/view/organization_images.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;
    final PageController pageController = PageController(initialPage: 0,viewportFraction: 1);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top,),
            SizedBox(
              height: mHeight * 24,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: [
                  BannerImage(imagePath: "images/main/main1.jpg"),
                  BannerImage(imagePath: "images/main/main2.jpg"),
                  BannerImage(imagePath: "images/main/main3.jpg"),
                ],
              ),
            ),
            SizedBox(height: mHeight * 2,),
            Row(
              children: [
                SizedBox(width: mSize * 2,),
                Text(
                    "후원 기관 보기",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: mHeight * 0.1,),
            MainScreenCard(
              imagePath1: "images/main/school.png", imagePath2: "images/main/scholarship.png",imagePath3: "images/main/welfare.png",
              text1: "교육", text2: "학술 · 장학", text3: "사회복지",
            ),
            MainScreenCard(
              imagePath1: "images/main/examination.png", imagePath2: "images/main/art.png",imagePath3: "images/main/etc.png",
              text1: "의료", text2: "예술 · 문화", text3: "기타",
            ),
          ],
        ),
      ),
    );
  }
}
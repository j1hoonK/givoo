import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageTextData {
  final String imagePath;
  final String text;

  ImageTextData({required this.imagePath, required this.text});
}

class MainScreen extends StatelessWidget {
  final List<ImageTextData> imageTextData = [
    ImageTextData(imagePath: 'images/login/logo.png', text: '텍스트 1'),
    ImageTextData(imagePath: 'images/login/logo.png', text: '텍스트 2'),
    ImageTextData(imagePath: 'images/login/logo.png', text: '텍스트 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250.0,
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ImageTextCarousel(
                        imagePath: imageTextData[i].imagePath,
                        text: imageTextData[i].text,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageTextCarousel extends StatelessWidget {
  final String imagePath;
  final String text;

  ImageTextCarousel({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,//텍스트 왼쪽정렬을 위해 추가
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imagePath,
            width: 200.0,
            height: 180.0,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

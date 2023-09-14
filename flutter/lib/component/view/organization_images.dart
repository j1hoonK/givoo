import 'package:flutter/material.dart';


class ImageTextData {
  final String imagePath;
  final String text;

  ImageTextData({required this.imagePath, required this.text});
}

class MainScreenCard extends StatelessWidget {
  MainScreenCard({super.key, required this.imagePath1, required this.imagePath2, required this.imagePath3, required this.text1, required this.text2, required this.text3});
  final String imagePath1, imagePath2, imagePath3;
  final String text1, text2, text3;


  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;

  final List<ImageTextData> imageTextData = [
    ImageTextData(imagePath: imagePath1, text: text1),
    ImageTextData(imagePath: imagePath2, text: text2),
    ImageTextData(imagePath: imagePath3, text: text3),
  ];
    return Column(
        children: [
          SizedBox(
            height: mHeight * 16,
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.symmetric(horizontal: mSize * 0.5),
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
      );
  }
}

class ImageTextCarousel extends StatelessWidget {
  final String imagePath;
  final String text;

  ImageTextCarousel({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size.width * 0.025;
    var mHeight = MediaQuery.of(context).size.height * 0.013;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TextButton(
            onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              maximumSize: MaterialStateProperty.all(Size.fromHeight(200))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,//텍스트 왼쪽정렬을 위해 추가
              children: [
                Image.asset(
                  imagePath,
                  width: mSize * 11,
                  height: mSize * 11,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: mHeight * 0.5),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

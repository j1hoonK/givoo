import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:givoo/component/model/com_dnthistory_model.dart';

class DntListCarousel extends StatelessWidget {
  DntListCarousel({super.key,required this.dntList});
  List<Donation> dntList;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CarouselSlider.builder(itemCount:dntList.length,
      itemBuilder:(context,idx,realIdx){
        return Container(
          height: height*0.5,
          color: Colors.black,
          child: ListTile(
            title: Text(dntList[idx].orgName),
          ),
        ) ;
      },
      options:  CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: false, // 무한 스크롤 사용 여부
        reverse: false, // 캐로셀 반대 방향
        autoPlay: false, // 자동 재생 여부
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

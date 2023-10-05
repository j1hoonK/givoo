import 'dart:async';

import 'package:flutter/material.dart';
import 'package:givoo/component/view/bottomnavbar.dart';
import 'package:givoo/provider/myLocation.dart';
import 'package:go_router/go_router.dart';

double? myLatitude;
double? myLongitude;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getMyLocation();
    Timer(Duration(milliseconds: 2000), () {
      context.push('/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    const imageLogoName = 'images/person.png';

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async => false,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: screenHeight * 0.2),
                  Image.asset(
                    "images/loading/1.png",
                    width: screenWidth * 0.4,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text('편리하게 기부하고',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                  ),
                  ),
                  Text('똑똑하게 공제받자',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 35
                    ),),
                  SizedBox(height: screenHeight * 0.1,),
                  SizedBox(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.23,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(
                        "images/loading/2.png",
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("© Copyright 2023, 기부어때",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: screenWidth * (14 / 360),
                          color: Colors.redAccent,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

void getMyLocation() async {
  MyLocation myLocation = MyLocation();
  await myLocation.getMyCurrentLocation();

  myLatitude = myLocation.lat;
  myLongitude = myLocation.long;
  print("(위도, 경도) == ($myLatitude, $myLongitude)");
}

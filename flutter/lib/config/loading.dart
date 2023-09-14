import 'package:flutter/material.dart';
import 'package:givoo/component/view/bottomnavbar.dart';
import 'package:givoo/provider/myLocation.dart';


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
    // TODO: implement initState
    super.initState();
    getMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    return BotNavBar();
  }
}

void getMyLocation() async {
  MyLocation myLocation = MyLocation();
  await myLocation.getMyCurrentLocation();

  myLatitude = myLocation.lat;
  myLongitude = myLocation.long;
  print("(위도, 경도) == ($myLatitude, $myLongitude)");
}

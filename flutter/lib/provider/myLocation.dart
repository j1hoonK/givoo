import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation with ChangeNotifier{
  double? lat;
  double? long;

  Future<void> getMyCurrentLocation()async{  // 위치정보 가져오기
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      print('permission == $permission');
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      long = position.longitude;
    } on Exception catch (e) {
      // TODO
      print('위치정보 확인 실패');
      print(e);
    }

  }

}
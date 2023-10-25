import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

DateTime? currentBackPressTime;

Future<bool> onWillPop() async {
  DateTime currentTime = DateTime.now();

  if (currentBackPressTime == null ||
      currentTime.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    currentBackPressTime = currentTime;
    Fluttertoast.showToast(
        msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color(0xff6E6E6E),
        fontSize: 20,
        toastLength: Toast.LENGTH_SHORT);
    return false;
  }
  return true;

  SystemNavigator.pop();
}
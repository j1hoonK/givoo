import 'package:flutter/material.dart';
import 'package:givoo/pages/mainpage/view/mainpage.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/provider/MyPageProvider.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '기부어때',
      theme: ThemeData(primaryColor: Colors.white),
      home: ChangeNotifierProvider(
        create: (context) => MyPageProvider(),
        child: MainMyGroup(),
      ),
    );
  }
}



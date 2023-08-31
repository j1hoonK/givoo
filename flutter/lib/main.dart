import 'package:flutter/material.dart';
import 'package:givoo/pages/mainpage/view/mainpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '기부어때',
      theme: ThemeData(primaryColor: Colors.white),
      home: MainPage()
    );
  }
}



import 'package:flutter/material.dart';
import 'package:givoo/pages/mypage/view/main_mygroup.dart';
import 'package:givoo/pages/mypage/view/mypage_dnthistory.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/provider/MyPageProvider.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '기부어때',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ChangeNotifierProvider(
        create: (context) => DonationProvider(),
        child: DonationHistory(),
      ),
    );
  }
}

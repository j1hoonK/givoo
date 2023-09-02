import 'package:flutter/material.dart';
import 'package:givoo/component/appbar.dart';

class MainMyGroup extends StatelessWidget {
  const MainMyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(title :"내 단체"),
    );
  }
}

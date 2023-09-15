import 'package:flutter/material.dart';
import 'package:givoo/config/palette.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.title1, required this.title2});

  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(title1, style: TextStyle(color: Palette.textColor2)),
        ),
        Expanded(
          child: Text(title2, style: TextStyle(color: Palette.textColor2)),
        ),
      ],
    );
  }
}

class SubSentence extends StatelessWidget {
  const SubSentence({super.key, required this.sentence1, required this.sentence2});
  final String sentence1;
  final String sentence2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(sentence1),
        ),
        Expanded(
          child: Text(sentence2),
        ),
      ],
    );
  }
}

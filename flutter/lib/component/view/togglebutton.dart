import 'package:flutter/material.dart';

class OrgToggle extends StatelessWidget {
  const OrgToggle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(15.0),
      child: Text(
        text,textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


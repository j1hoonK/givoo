import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(imagePath, fit: BoxFit.fitWidth),
    );
  }
}
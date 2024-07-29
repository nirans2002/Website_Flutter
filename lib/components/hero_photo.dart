import 'package:flutter/material.dart';

class HeroPhotoWidget extends StatelessWidget {
  const HeroPhotoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/sample_pic.png"));
  }
}
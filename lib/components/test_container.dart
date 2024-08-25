import 'package:flutter/material.dart';

Widget testContainer(
    {required text,
    required color,
    required BuildContext context,
    height,
    width}) {
  // final h
  // final String text;
  // final double? height;
  // final double? width;
  return Expanded(
    child: Container(
      height: height,
      width: width,
      color: color,
      child: Center(child: Text(text)),
    ),
  );
}

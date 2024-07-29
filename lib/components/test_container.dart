import 'package:flutter/material.dart';

Widget testContainer(text, color,BuildContext context) {
    return Center(
      child: Container(
        color: color,
        child: Text(text),
      ),
    );
  }
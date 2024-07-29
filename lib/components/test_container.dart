import 'package:flutter/material.dart';

Widget testContainer(text, color,BuildContext context) {
    return Center(
      child: Container(
        color: color,
        child: ElevatedButton(
          child: Text(text),
          onPressed: () {
            debugPrint("Press detected from $text");
          },
        ),
      ),
    );
  }
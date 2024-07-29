import 'package:flutter/material.dart';

Widget testContainer(text, color, BuildContext context) {
  // final Widget child;
  return Expanded(
    child: Container(
      // height:MediaQuery.of(context).size.h ,
      // width: MediaQuery.of(context).size.width,
      color: color,
      child: Text(text),
    ),
  );
}

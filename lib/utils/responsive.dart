import 'package:flutter/material.dart';

class Responsive {
  static const mobileScreenSizeLimit = 650;
  static const tabletScreenSizeLimit = 650;
  static const largeScreenSizeLimit = 1100;

  static const double paddingScaleFactor = 0.5;

  /// mobile < 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  /// tablet >= 650
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  ///desktop >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  // Function getScreenSize(BuildContext context) {
  //   final width = MediaQuery.of(context).size.width;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(builder: (context, constraints) {
  //     if (constraints.maxWidth >= 1100) {
  //       return desktop;
  //     } else if (constraints.maxWidth >= 650) {
  //       return tablet;
  //     } else {
  //       return mobile;
  //     }
//     });
//   }
// }
}

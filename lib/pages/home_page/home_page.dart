import 'package:flutter/material.dart';
import 'package:niransnarayanan/utils/responsive.dart';

import 'home_page_desktop.dart';
import 'home_page_mobile.dart';
import 'home_page_tablet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // Responsive responsive ;
  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return HomePageMobile(context);
    } else if (Responsive.isDesktop(context)) {
      return HomePageDesktop(context);
    } else {
      return HomePageTablet(context);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:niransnarayanan/components/custom_navbar.dart';
import 'package:niransnarayanan/components/test_container.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile(
    BuildContext context, {
    super.key,
  });
  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavBar(),
      body: Row(
        children: [
          testContainer("Mobile main row 1", Colors.greenAccent, context),
          testContainer("Mobile main row 2", Colors.green, context),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:niransnarayanan/components/custom_navbar.dart';
import 'package:niransnarayanan/components/test_container.dart';

class HomePageTablet extends StatelessWidget {
  const HomePageTablet(
    BuildContext context, {
    super.key,
  });
  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customNavBar(context),
      body: Row(
        children: [
          testContainer("Tablet main row 1", Colors.greenAccent, context),
          testContainer("Tablet main row 2", Colors.green, context),
        ],
      ),
    );
  }
}

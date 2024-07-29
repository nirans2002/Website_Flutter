import 'package:flutter/material.dart';
import 'package:niransnarayanan/components/custom_navbar.dart';
import 'package:niransnarayanan/components/test_container.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({
    super.key,
  });
  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customNavBar(context),
      body: const BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        testContainer("Desktop main row 1", Colors.greenAccent, context),
        testContainer("Desktop main row 2", Colors.green, context),
      ],
    );
  }
}

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
      appBar: customNavBar(context),
      body: Row(
        children: [
          testContainer(
              text: "Mobile view", color: Colors.blueAccent, context: context),
        ],
      ),
    );
  }
}

import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';
import 'package:niransnarayanan/utils/keys.dart';

PreferredSizeWidget? customNavBar(BuildContext context) {
  return AdaptiveNavBar(
    screenWidth: MediaQuery.of(context).size.width,
    elevation: 0,
    title: Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/Union.png"),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            'Niran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    navBarItems: [
      NavBarItem(
        text: "home",
        onTap: () {
          // Navigator.pushNamed(context, "routeName");
          Scrollable.ensureVisible(heroKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOut);
        },
      ),
      NavBarItem(
        text: "works",
        onTap: () {
          // Navigator.pushNamed(context, "routeName");
          Scrollable.ensureVisible(projectKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOut);
        },
      ),
      NavBarItem(
        text: "about-me",
        onTap: () {
          // Navigator.pushNamed(context, "routeName");
          Scrollable.ensureVisible(aboutKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOut);
        },
      ),
      NavBarItem(
        text: "contacts",
        onTap: () {
          // Navigator.pushNamed(context, "routeName");
          Scrollable.ensureVisible(contactKey.currentContext!,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOut);
        },
      ),
    ],
  );
}

import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:flutter/material.dart';

class NavbarTabItem extends NavBarItem {
  final String name;

  NavbarTabItem(this.name, {super.key}) : super(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            "#",
            style: TextStyle(color: Color(0xFFFF9900)),
          ),
          Text(
            name,
            style: const TextStyle(color: Color(0xFF87909A)),
          ),
        ],
      ),
    );
  }
}

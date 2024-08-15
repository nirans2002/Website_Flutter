import 'package:flutter/material.dart';
import 'package:niransnarayanan/utils/responsive.dart';

class SkillItemTile extends StatelessWidget {
  const SkillItemTile({
    super.key,
    required this.skill,
  });

  final String skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
      child: Container(
        // color: Colors.grey,
        // height: (getRandomHeight() % 5 + 1) * 50.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFF9900),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
          child: Center(
            child: Text(
              skill,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

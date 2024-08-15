import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/utils/responsive.dart';

class ProjectItemTile extends StatelessWidget {
  const ProjectItemTile({
    super.key,
    required this.project,
  });

  final Project project;

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
          child: Column(
            children: [
              Text(
                project.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

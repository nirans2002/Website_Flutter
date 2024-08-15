import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.orange,
                ),
              ),
              // const SizedBox(
              //   height: 12,
              // ),
              Text(
                project.description,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: project.tags.map((tag) {
                    return Chip(
                      // backgroundColor: Colors.orange,
                      padding: const EdgeInsets.all(4.0),
                      side: const BorderSide(color: Colors.grey, width: 0.5),
                      label: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          color: Colors.orange,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    tooltip: "Go to GitHub Repo",
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.github,
                      color: Colors.orange,
                    ),
                  ),
                  IconButton(
                    tooltip: "See live project",
                    onPressed: () {},
                    icon: const Icon(
                      Icons.wb_cloudy_outlined,
                      color: Colors.orange,
                    ),
                  ),
                  IconButton(
                    tooltip: "go to documentation",
                    onPressed: () {},
                    icon: Icon(
                      Icons.my_library_books_outlined,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

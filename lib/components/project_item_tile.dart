import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/utils/responsive.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

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
                  fontSize: 20,
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
              Text(
                project.description,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              project.imgUrl != null
                  ? Image.network(project.imgUrl!)
                  : Container(),
              // tags
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Wrap(
                  spacing: 8.0,
                  children: project.tags.map((tag) {
                    return Chip(
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

              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(
                    tooltipText: "GitHub Repo",
                    link: project.githubRepo,
                    icon: FontAwesomeIcons.github,
                  ),
                  CustomIconButton(
                    tooltipText: "Live project",
                    link: project.liveLink,
                    icon: Icons.wb_cloudy_outlined,
                  ),
                  CustomIconButton(
                    tooltipText: "Documentation",
                    link: project.documentationUrl,
                    icon: Icons.my_library_books_outlined,
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

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.tooltipText,
    required this.link,
    required this.icon,
  });

  final String tooltipText;
  final String? link;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: link != null ? tooltipText : "$tooltipText not available",
      color: Colors.orange,
      // hoverColor: Colors.transparent,
      hoverColor: const Color.fromARGB(113, 61, 61, 61),
      disabledColor: const Color.fromARGB(82, 158, 158, 158),
      onPressed: link != null
          ? () {
              html.window.open(link!, 'new tab');
            }
          : null,
      icon: Icon(icon),
    );
  }
}

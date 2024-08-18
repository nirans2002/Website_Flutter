import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niransnarayanan/components/contact_info_item.dart';
import 'package:niransnarayanan/components/contact_me_button.dart';
import 'package:niransnarayanan/components/custom_navbar.dart';
import 'package:niransnarayanan/components/experience_tile.dart';
import 'package:niransnarayanan/components/footer.dart';
import 'package:niransnarayanan/components/hero_photo.dart';
import 'package:niransnarayanan/components/project_item_tile.dart';
import 'package:niransnarayanan/components/section_heading.dart';
import 'package:niransnarayanan/components/skill_item_tile.dart';
import 'package:niransnarayanan/data/mydata.dart';
import 'package:niransnarayanan/utils/responsive.dart';

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
      body: const BodyTabletWidget(),
    );
  }
}

class BodyTabletWidget extends StatelessWidget {
  const BodyTabletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          // sections
          HeroSection(),
          AboutMeSection(),
          ExperienceSection(),
          SkillSection(),
          ProjectSection(),
          ContactSection(),
          FooterSection(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const HeroPhotoWidget(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                    text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "I am ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Robotics Enthusiast ",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "and\n",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: "Flutter Developer",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                )),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 8),
                child: Text(
                  "crafts robots where technologies \nmeet creativity",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              const ContactMeButton()
            ],
          ),
        ),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          text: "contact-me",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 150 * Responsive.paddingScaleFactor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
                child: Text(
                  "I’m interested in freelance opportunities.\nHowever, if you have other request or question,don’t hesitate to contact me",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white60)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContactInfoItem(
                        icon: Icons.email_outlined,
                        text: MyData.email,
                      ),
                      ContactInfoItem(
                        icon: FontAwesomeIcons.linkedinIn,
                        text: MyData.linkedinProfile,
                      ),
                      ContactInfoItem(
                        icon: Icons.phone,
                        text: MyData.phoneNo,
                      ),
                      ContactInfoItem(
                        icon: FontAwesomeIcons.github,
                        text: MyData.githubProfile,
                      ),
                    ],
                  ),
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          text: "about-me",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 150 * Responsive.paddingScaleFactor),
          child: Padding(
            padding: const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
            child: Text(
              MyData.aboutmeText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SkillSection extends StatelessWidget {
  const SkillSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          text: "my-skills",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 150 * Responsive.paddingScaleFactor),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: MyData.skills.length,
            itemBuilder: (context, index) {
              final skill = MyData.skills[index];
              return SkillItemTile(skill: skill);
            },
          ),
        ),
      ],
    );
  }
}

class ProjectSection extends StatelessWidget {
  const ProjectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          text: "my-projects",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 200 * Responsive.paddingScaleFactor),
          child: MasonryGridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: MyData.projects.length,
            itemBuilder: (context, index) {
              final project = MyData.projects[index];
              return ProjectItemTile(project: project);
            },
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          text: "my-experience",
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 200 * Responsive.paddingScaleFactor),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: MyData.experienceList.length,
            itemBuilder: (context, index) {
              final experience = MyData.experienceList[index];
              return ExperienceTile(experience: experience);
            },
          ),
        ),
      ],
    );
  }
}

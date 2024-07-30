import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niransnarayanan/components/custom_navbar.dart';
import 'package:niransnarayanan/components/footer.dart';
import 'package:niransnarayanan/components/hero_photo.dart';
import 'package:niransnarayanan/components/section_heading.dart';
import 'package:niransnarayanan/data/mydata.dart';
import 'package:niransnarayanan/utils/responsive.dart';

import '../../components/contact_info_item.dart';
import '../../components/contact_me_button.dart';

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
    return const SingleChildScrollView(
      child: Column(
        children: [
          // sections
          HeroSection(),
          AboutMeSection(),
          // SkillsSection(),
          // ProjectSection(),
          ContactSection(),
          FooterSection(),
        ],
      ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
              child: Text(
                " I’m interested in freelance opportunities.\n However, if you have other request or question, \n don’t hesitate to contact me",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // left column
            Padding(
              padding:
                  const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
              child: Text(
                MyData.aboutmeText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                ),
              ),
            ),
            // right column
            // Padding(
            //   padding:
            //       const EdgeInsets.all(16.0 * Responsive.paddingScaleFactor),
            //   child: Container(
            //     decoration:
            //         BoxDecoration(border: Border.all(color: Colors.white60)),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         ContactInfoItem(
            //           icon: Icons.email_outlined,
            //           text: MyData.email,
            //         ),
            //         ContactInfoItem(
            //           icon: FontAwesomeIcons.linkedinIn,
            //           text: MyData.linkedinProfile,
            //         ),
            //         ContactInfoItem(
            //           icon: Icons.phone,
            //           text: MyData.phoneNo,
            //         ),
            //         ContactInfoItem(
            //           icon: FontAwesomeIcons.github,
            //           text: MyData.githubProfile,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Spacer(),
          ],
        ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // testContainer("side rail row 1", Colors.green, context),
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
                        color: Colors.white,
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
                        color: Colors.white,
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
                    color: Colors.white,
                  ),
                ),
              ),
              const ContactMeButton()
            ],
          ),
        ),
        const HeroPhotoWidget(),
      ],
    );
  }
}

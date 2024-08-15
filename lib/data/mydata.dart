import 'package:niransnarayanan/data/project.dart';

class MyData {
  static String firstName = 'Niran';
  static String fullName = 'Niran S Narayanan';
  static String email = 'nirans2002@gmail.com';
  static String linkedinProfile = 'niran-s-narayanan';
  static String linkedinUrl = 'https://www.linkedin.com/in/niran-s-narayanan/';
  static String phoneNo = '+91 82898 31638';
  static String githubProfile = 'nirans2002';
  static String githubUrl = 'https://github.com/nirans2002';
  static String aboutmeText =
      "hello I'am Niran S Narayanan \nElectrical & Electronics Engineering graduate.\nI build robots and Flutter Applications.\nInterested in IoT, Robotics, Microcontrollers, Machine learning and AI.\nEquipped with basic knowledge and actively learning ROS2, Python,\nDjango, C Programming, Dart, HTML, CSS. React, Arduino and Raspberry Pi.";

  static List<String> skills = [
    "Flutter",
    "Robotics",
    "Python",
    "Dart",
    "HTML",
    "CSS",
    "ROS2",
    "ROS",
    "Arduino",
    "C Programming",
    "Fusion 360",
    "Programming",
  ];

  static List<Project> projects = [
    Project(
      name: "Node-MCU Rover Flutter",
      description:
          "A Flutter app controller for a NodeMCU-controlled rover bot.",
      githubRepo: "https://github.com/nirans2002/Node-MCU-Rover-Flutter",
      tags: ["flutter", "nodeMCU", "robotics", "mobile"],
      liveLink: "https://example.com/rover-flutter",
      imgUrl: "https://example.com/rover-image.png",
      ytUrl: "https://youtube.com/rover-flutter-demo",
      documentationUrl: "https://example.com/docs/rover-flutter",
    ),
    Project(
      name: "Static Educational Website",
      description: "A static web page for an educational institution.",
      githubRepo: "https://github.com/nirans2002/learn.edu",
      tags: ["HTML", "CSS", "static site"],
      liveLink: "https://example.com/learn-edu",
      imgUrl: "https://example.com/learn-image.png",
      ytUrl: "",
      documentationUrl: "https://example.com/docs/learn-edu",
    ),
    Project(
      name: "Portfolio Website",
      description: "Personal portfolio showcasing projects and skills.",
      githubRepo: "https://github.com/nirans2002/nirans2002.github.io",
      tags: ["HTML", "CSS", "JavaScript"],
      liveLink: "https://nirans2002.github.io/",
      imgUrl: "https://example.com/portfolio-image.png",
      ytUrl: "",
      documentationUrl: "https://example.com/docs/portfolio",
    ),
    Project(
      name: "ESP32 IoT Weather Station",
      description:
          "An IoT-based weather station using ESP32 to monitor temperature and humidity.",
      githubRepo: "https://github.com/nirans2002/ESP32-IoT-Weather-Station",
      tags: ["IoT", "ESP32", "sensor"],
      liveLink: "",
      imgUrl: "https://example.com/weather-station-image.png",
      ytUrl: "",
      documentationUrl: "https://example.com/docs/weather-station",
    ),
    Project(
      name: "Robot Arm Controller",
      description: "A Python-based controller for a DIY robot arm.",
      githubRepo: "https://github.com/nirans2002/Robot-Arm-Controller",
      tags: ["Python", "robotics", "controller"],
      liveLink: "",
      imgUrl: "https://example.com/robot-arm-image.png",
      ytUrl: "",
      documentationUrl: "https://example.com/docs/robot-arm-controller",
    ),
  ];
}

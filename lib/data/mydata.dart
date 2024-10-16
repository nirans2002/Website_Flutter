import 'package:niransnarayanan/data/experience.dart';
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
      name: "UAV UGV",
      description:
          "Consisting of a (UAV)Drone and a (UGV) Rover, where the UAV can land on the UGV autonomously and act as an On-the-Go charger for the UAV. The UGV is able to traverse rough terrains with its multi-terrain design.With autonomous SLAMing and guidance the combo can be deployed in surveillance of disaster-struck areas, surveying of land in difficult terrains, etc.",
      githubRepo: "https://github.com/nirans2002/ros1-ugv.git",
      tags: ["ROS", "Robotics", "Fusion360", "Python"],
      liveLink: null,
      imgUrl: "https://picsum.photos/200",
      ytUrl: null,
      documentationUrl: null,
      startDate: DateTime(2023, 04),
      endDate: null,
    ),
    Project(
      name: "Under Water Pipeline Inspection Vehicle",
      description:
          "A remotely operated underwater vehicle suitable for pipelines was designed and developed to detect in pipe cracks, clogs, and deformities. The vehicle is designed by taking inspiration from bio-mimicry and the streamlined structures enables smooth motion inside water. The vehicle has three thrusters, providing motion in 3 DOF. The vehicle uses image processing techniques to identify and flag the deformities from the visuals from an on-board camera.",
      githubRepo: "https://github.com/nirans2002/makri.git",
      tags: ["ROS", "Robotics", "Fusion360", "Python"],
      liveLink: null,
      imgUrl: "https://picsum.photos/200",
      ytUrl: null,
      documentationUrl: null,
      startDate: DateTime(2023, 06),
      endDate: DateTime(2024, 06),
    ),
    Project(
      name: "3 Wheeled Omni directional Robot ROS2",
      description:
          "Three-wheeled omni-directional robots with esp32 and ROS2.For Eyantra IITB competition 2023 -2024.The robots are controlled by the ROS2 and microROS, based on the feedback from a over head camera feed.",
      githubRepo: "https://github.com/nirans2002/eyrc23_hb_1037.git",
      tags: [
        "ROS2",
        "microROS",
        "Robotics",
        "Proteus",
      ],
      liveLink: "https://nirans2002.github.io/",
      imgUrl: "https://picsum.photos/200",
      ytUrl: "https://www.youtube.com/watch?v=ZQ5J6oupduU",
      documentationUrl: null,
    ),
    Project(
      name: "Laser Morse Code Transmitter",
      description:
          "A LASER Morse code transmitter encodes the text provided to Morse code and sends it as light pulses. ESP32-based NodeMCU is used in the transmitter which receives the text to be sent as serial input from a computer or via Bluetooth. Programming is done in MicroPython.",
      githubRepo: "https://github.com/nirans2002/ESP32-IoT-Weather-Station",
      tags: ["ESP32", "Micro-python", "Micro-controller"],
      liveLink: "",
      imgUrl: "https://picsum.photos/200",
      ytUrl: "",
      documentationUrl:
          "https://www.linkedin.com/in/niran-s-narayanan/details/projects/1721223349116/single-media-viewer/?type=DOCUMENT&profileId=ACoAADXWgKABSzwc8iBNn5b5h_RsnK6jADOjoBA",
    ),
  ];

  static List<Experience> experienceList = [
    Experience(
      title: "Chairperson",
      employmentType: "fullTime",
      companyName: "INDIAN SOCIETY FOR TECHNICAL EDUCATION - CET",
      companyImgUrl:
          "https://media.licdn.com/dms/image/v2/D560BAQHu4sLIF2tm6w/company-logo_100_100/company-logo_100_100/0/1714468324728?e=1732147200&v=beta&t=rYzfrCOzvaqHrXYHLGr5xlPUyUZ2I8Gq9SjvfnKXRLw",
      isCurrentlyWorking: true,
      startdate: DateTime(2023, 10),
      enddate: DateTime(2024, 6),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Vice Chair",
      employmentType: "fullTime",
      companyName: "College of Engineering Trivandrum",
      companyImgUrl: null,
      isCurrentlyWorking: true,
      startdate: DateTime(2022, 10),
      enddate: DateTime(2023, 12),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Project Coordinator",
      employmentType: "fullTime",
      companyName: "The Institution of Engineering and Technology",
      companyImgUrl:
          "https://media.licdn.com/dms/image/v2/D560BAQHu4sLIF2tm6w/company-logo_100_100/company-logo_100_100/0/1714468324728?e=1732147200&v=beta&t=rYzfrCOzvaqHrXYHLGr5xlPUyUZ2I8Gq9SjvfnKXRLw",
      isCurrentlyWorking: true,
      startdate: DateTime(2022, 11),
      enddate: DateTime(2023, 11),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Flutter Developer Intern",
      employmentType: "internship",
      companyName: "YE Stack",
      companyImgUrl:
          "https://media.licdn.com/dms/image/v2/D560BAQHu4sLIF2tm6w/company-logo_100_100/company-logo_100_100/0/1714468324728?e=1732147200&v=beta&t=rYzfrCOzvaqHrXYHLGr5xlPUyUZ2I8Gq9SjvfnKXRLw",
      isCurrentlyWorking: false,
      startdate: DateTime(2022, 8),
      enddate: DateTime(2023, 4),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Ninja Entrepreneur",
      employmentType: "internship",
      companyName: "Coding Ninjas",
      companyImgUrl: null,
      isCurrentlyWorking: false,
      startdate: DateTime(2022, 2),
      enddate: DateTime(2022, 10),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Web Developer",
      employmentType: "partTime",
      companyName: "AstroCET",
      companyImgUrl: null,
      isCurrentlyWorking: false,
      startdate: DateTime(2021, 12),
      enddate: DateTime(2022, 6),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Campus Ambassador",
      employmentType: "internship",
      companyName: "E-Cell, IIT Guwahati",
      companyImgUrl: null,
      isCurrentlyWorking: false,
      startdate: DateTime(2021, 11),
      enddate: DateTime(2022, 1),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Project Lead",
      employmentType: "fullTime",
      companyName: "GDSC CET",
      companyImgUrl: null,
      isCurrentlyWorking: false,
      startdate: DateTime(2022, 9),
      enddate: DateTime(2023, 8),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Co-Founder",
      employmentType: "freelance",
      companyName: "Neutrobix",
      companyImgUrl: null,
      isCurrentlyWorking: false,
      startdate: DateTime(2022, 6),
      enddate: DateTime(2023, 10),
      location: 'College of Engineering, Trivandrum',
    ),
    Experience(
      title: "Webmaster",
      employmentType: "fullTime",
      companyName: "The Institution of Engineering and Technology",
      companyImgUrl: null,
      isCurrentlyWorking: false,
      startdate: DateTime(2021, 11),
      enddate: DateTime(2023, 1),
      location: 'College of Engineering, Trivandrum',
    ),
  ];
}

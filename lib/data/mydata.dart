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
      imgUrl:
          "https://media.licdn.com/dms/image/v2/D562DAQFQPHgabO-Ocw/profile-treasury-image-shrink_800_800/profile-treasury-image-shrink_800_800/0/1689485756176?e=1724482800&v=beta&t=A0FFPzDGvy5IWqyuBJfUtGOxUlJkqx2VR-lN6s3OeGA",
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
      imgUrl:
          "https://media.licdn.com/dms/image/v2/D562DAQHOJ6XUXWqFRg/profile-treasury-image-shrink_1920_1920/profile-treasury-image-shrink_1920_1920/0/1718425885078?e=1724490000&v=beta&t=nOpf1n6f3C4Y5Da5dL39Dgpe487S6m0DUbrUwPWzsy4",
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
      imgUrl:
          "https://media.licdn.com/dms/image/v2/D562DAQFg84T3hvyLEw/profile-treasury-image-shrink_800_800/profile-treasury-image-shrink_800_800/0/1719858509776?e=1724490000&v=beta&t=FwWVi510u9lAX9jx9XMrjoVpQuTpkwEYZ0zWM8WoatI",
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
      imgUrl:
          "https://media.licdn.com/dms/image/v2/D562DAQHXu9xF9HnJtg/profile-treasury-image-shrink_1920_1920/profile-treasury-image-shrink_1920_1920/0/1723884863094?e=1724490000&v=beta&t=nGPeF04MiikqANYdwRkR4q1IMjifFvRFm_XCatP2axI",
      ytUrl: "",
      documentationUrl:
          "https://www.linkedin.com/in/niran-s-narayanan/details/projects/1721223349116/single-media-viewer/?type=DOCUMENT&profileId=ACoAADXWgKABSzwc8iBNn5b5h_RsnK6jADOjoBA",
    ),
  ];
}

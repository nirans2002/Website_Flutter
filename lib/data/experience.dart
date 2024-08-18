// ignore_for_file: public_member_api_docs, sort_constructors_first
class Experience {
  final String title;
  final String? employmentType;
  final String companyName;
  final String? companyImgUrl;
  final bool isCurrentlyWorking;
  final DateTime? startdate;
  final DateTime? enddate;
  final String location;

  Experience({
    required this.title,
    required this.employmentType,
    required this.companyName,
    this.companyImgUrl,
    required this.isCurrentlyWorking,
    this.startdate,
    this.enddate,
    required this.location,
  });
}

enum EmployeeType { fullTime, partTime, internship, freelance, selfEmployed }

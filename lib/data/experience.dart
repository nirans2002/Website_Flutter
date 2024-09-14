import 'package:cloud_firestore/cloud_firestore.dart';

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

  Experience.fromFirestore(DocumentSnapshot doc)
      : title = doc['title'],
        employmentType = doc['employmentType'],
        companyName = doc['companyName'],
        companyImgUrl = doc['companyImgUrl'],
        isCurrentlyWorking = doc['isCurrentlyWorking'],
        startdate = (doc['startdate'] as Timestamp?)?.toDate(),
        enddate = (doc['enddate'] as Timestamp?)?.toDate(),
        location = doc['location'];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'employmentType': employmentType,
      'companyName': companyName,
      'companyImgUrl': companyImgUrl,
      'isCurrentlyWorking': isCurrentlyWorking,
      'startdate': startdate,
      'enddate': enddate,
      'location': location,
    };
  }
}

enum EmployeeType { fullTime, partTime, internship, freelance, selfEmployed }

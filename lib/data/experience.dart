import 'package:cloud_firestore/cloud_firestore.dart';

class Experience {
  String? id;
  final String? description;
  final String title;
  final String? employmentType;
  final String companyName;
  final String? companyImgUrl;
  final bool isCurrentlyWorking;
  final DateTime? startdate;
  final DateTime? enddate;
  final String location;

  Experience({
    this.id,
    this.description,
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
      : id = doc.id,
        title = doc['title'],
        description = doc['description'],
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
      'description': description,
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

import 'package:cloud_firestore/cloud_firestore.dart';
class Project {
  String? id;  // Add this line for storing document ID
  final String name;
  final String description;
  final String? githubRepo;
  final String? liveLink;
  final List tags;
  final String? imgUrl;
  final String? ytUrl;
  final String? documentationUrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<Contributor>? otherContributors;

  Project({
    this.id,  // Include id in the constructor
    required this.name,
    required this.description,
    required this.tags,
    this.githubRepo,
    this.liveLink,
    this.imgUrl,
    this.ytUrl,
    this.documentationUrl,
    this.startDate,
    this.endDate,
    this.otherContributors,
  });

  Project.fromFirestore(DocumentSnapshot doc)
      : id = doc.id,  // Capture the document ID
        name = doc['name'],
        description = doc['description'],
        githubRepo = doc['githubRepo'],
        liveLink = doc['liveLink'],
        tags = List<String>.from(doc['tags']),
        imgUrl = doc['imgUrl'],
        ytUrl = doc['ytUrl'],
        documentationUrl = doc['documentationUrl'],
        startDate = (doc['startDate'] as Timestamp?)?.toDate(),
        endDate = (doc['endDate'] as Timestamp?)?.toDate(),
        otherContributors = (doc['otherContributors'] as List<dynamic>?)
            ?.map((e) => Contributor.fromMap(e))
            .toList();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'githubRepo': githubRepo,
      'liveLink': liveLink,
      'tags': tags,
      'imgUrl': imgUrl,
      'ytUrl': ytUrl,
      'documentationUrl': documentationUrl,
      'startDate': startDate,
      'endDate': endDate,
      'otherContributors': otherContributors?.map((e) => e.toMap()).toList(),
    };
  }
}


class Contributor {
   String name;
   String linkedinProfileLink;

  Contributor({
    required this.name,
    required this.linkedinProfileLink,
  });

  factory Contributor.fromMap(Map<String, dynamic> map) {
    return Contributor(
      name: map['name'],
      linkedinProfileLink: map['linkedinProfileLink'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'linkedinProfileLink': linkedinProfileLink,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Skill {
  String? id;
  final String skill;

  Skill({
    this.id,
    required this.skill,
  });

  Skill.fromFirestore(DocumentSnapshot doc)
      : id = doc.id,
        skill = doc['skill'];

  Map<String, dynamic> toMap() {
    return {
      'skill': skill,
    };
  }
}

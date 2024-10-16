// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:niransnarayanan/data/experience.dart';
// import 'package:niransnarayanan/data/project.dart';

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Fetch Experiences
//   Stream<List<Experience>> getExperiences() {
//     return _firestore.collection('experiences').snapshots().map((snapshot) =>
//         snapshot.docs.map((doc) => Experience.fromFirestore(doc)).toList());
//   }

//   // Fetch Projects
//   Stream<List<Project>> getProjects() {
//     return _firestore.collection('projects').snapshots().map((snapshot) =>
//         snapshot.docs.map((doc) => Project.fromFirestore(doc)).toList());
//   }

//   // Add Experience
//   Future<void> addExperience(Experience experience) async {
//     await _firestore.collection('experiences').add(experience.toMap());
//   }

//   // Update Experience
//   Future<void> updateExperience(String id, Experience experience) async {
//     await _firestore
//         .collection('experiences')
//         .doc(id)
//         .update(experience.toMap());
//   }

//   // Delete Experience
//   Future<void> deleteExperience(String id) async {
//     await _firestore.collection('experiences').doc(id).delete();
//   }

//   // Add Project
//   Future<void> addProject(Project project) async {
//     await _firestore.collection('projects').add(project.toMap());
//   }

//   // Update Project
//   Future<void> updateProject(String id, Project project) async {
//     await _firestore.collection('projects').doc(id).update(project.toMap());
//   }

//   // Delete Project
//   Future<void> deleteProject(String id) async {
//     await _firestore.collection('projects').doc(id).delete();
//   }

//   Future<void> addContributor(Contributor contributor) async {
//     await _firestore.collection('contributors').add(contributor.toMap());
//   }

//   Future<void> updateContributor(String docId, Contributor contributor) async {
//     await _firestore
//         .collection('contributors')
//         .doc(docId)
//         .update(contributor.toMap());
//   }

//   Future<void> deleteContributor(String docId) async {
//     await _firestore.collection('contributors').doc(docId).delete();
//   }
// }

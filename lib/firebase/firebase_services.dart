import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:niransnarayanan/data/project.dart';

class FirebaseMethodsProject {
  // Add a new project
  Future<void> addProject(Project newProject) async {
    await FirebaseFirestore.instance.collection('projects').add(newProject.toMap());
  }

  // Update an existing project
  Future<void> editProject(String projectId, Project updatedProject) async {
    await FirebaseFirestore.instance.collection('projects').doc(projectId).update(updatedProject.toMap());
  }

  // Delete a project
  Future<void> deleteProject(String projectId) async {
    await FirebaseFirestore.instance.collection('projects').doc(projectId).delete();
  }

  // Fetch projects stream
  Stream<QuerySnapshot> getProjectsStream() {
    return FirebaseFirestore.instance.collection('projects').snapshots();
  }
}

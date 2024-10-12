import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirestoreService {
  final CollectionReference projectCollection =
      FirebaseFirestore.instance.collection('projects');

  // Add a project
  Future<void> addProject(Project project) {
    return projectCollection.add(project.toMap());
  }

  // Update a project
  Future<void> updateProject(String docId, Project project) {
    return projectCollection.doc(docId).update(project.toMap());
  }

  // Get all projects
  Stream<List<Project>> getProjects() {
    return projectCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Project.fromFirestore(doc)).toList());
  }

  // Delete a project
  Future<void> deleteProject(String docId) {
    return projectCollection.doc(docId).delete();
  }

  // Upload Image to Firebase Storage and get the URL
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(String filePath) async {
    try {
      // Create a unique file name
      String fileName =
          'images/${DateTime.now().millisecondsSinceEpoch}';

      // Create a reference to the storage location
      Reference ref = _storage.ref(fileName);

      // Upload the file
      File file = File(filePath);
      // ref.putData(file, SettableMetadata(contentType: 'image/jpeg'));
      await ref.putFile(
          file,
          SettableMetadata(
              contentType: 'image/jpeg')); // Use putFile for Windows
      // Get the download URL
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }
}

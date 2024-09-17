import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart'; // For file name extraction



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


  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload multiple images and return their URLs
  Future<List<String>> uploadImages(List<File> imageFiles) async {
    List<String> downloadUrls = [];

    for (var imageFile in imageFiles) {
      try {
        String fileName = basename(imageFile.path); // Extract file name
        Reference ref = _storage.ref().child('projects/images/$fileName');

        // Upload the image to Firebase Storage
        UploadTask uploadTask = ref.putFile(imageFile);

        // Get the image download URL after the upload is complete
        TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
        String downloadUrl = await snapshot.ref.getDownloadURL();

        // Add the URL to the list
        downloadUrls.add(downloadUrl);
      } catch (e) {
        debugPrint("Error uploading image: $e");
      }
    }

    return downloadUrls;
  }
}


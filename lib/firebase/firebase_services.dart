import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Firebase Authentication & Firestore instance
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

/// Firebase Authentication Functions
class AuthService {
  // Sign in with Email and Password
  static Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // Sign out the user
  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  // Get current user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }
}

/// Project Model
class Project {
  final String name;
  final String description;
  final String? githubRepo;
  final String? liveLink;
  final List<String> tags;
  final String? imgUrl;
  final String? ytUrl;
  final String? documentationUrl;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<Contributor>? otherContributors;

  Project({
    required this.name,
    required this.description,
    this.githubRepo,
    this.liveLink,
    required this.tags,
    this.imgUrl,
    this.ytUrl,
    this.documentationUrl,
    this.startDate,
    this.endDate,
    this.otherContributors,
  });

  // Convert Project object to Map for Firestore
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
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'otherContributors': otherContributors?.map((contrib) => contrib.toMap()).toList(),
    };
  }

  // Create a Project object from a Firestore snapshot
  static Project fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Project(
      name: data['name'],
      description: data['description'],
      githubRepo: data['githubRepo'],
      liveLink: data['liveLink'],
      tags: List<String>.from(data['tags']),
      imgUrl: data['imgUrl'],
      ytUrl: data['ytUrl'],
      documentationUrl: data['documentationUrl'],
      startDate: data['startDate'] != null ? DateTime.parse(data['startDate']) : null,
      endDate: data['endDate'] != null ? DateTime.parse(data['endDate']) : null,
      otherContributors: data['otherContributors'] != null
          ? (data['otherContributors'] as List)
              .map((contrib) => Contributor.fromMap(contrib))
              .toList()
          : null,
    );
  }
}

/// Firebase Firestore Functions
class FirestoreService {
  // Add a new project
  static Future<void> addProject(Project project) async {
    try {
      await _firestore.collection('projects').add(project.toMap());
      print("Project added successfully");
    } catch (e) {
      print("Error adding project: $e");
    }
  }

  // Update a project
  static Future<void> updateProject(String projectId, Project project) async {
    try {
      await _firestore.collection('projects').doc(projectId).update(project.toMap());
      print("Project updated successfully");
    } catch (e) {
      print("Error updating project: $e");
    }
  }

  // Delete a project
  static Future<void> deleteProject(String projectId) async {
    try {
      await _firestore.collection('projects').doc(projectId).delete();
      print("Project deleted successfully");
    } catch (e) {
      print("Error deleting project: $e");
    }
  }

  // Stream for project list
  static Stream<List<Project>> getProjects() {
    return _firestore.collection('projects').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Project.fromFirestore(doc)).toList());
  }
}

/// Contributor Model
class Contributor {
  final String name;
  final String role;

  Contributor({required this.name, required this.role});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
    };
  }

  static Contributor fromMap(Map<String, dynamic> data) {
    return Contributor(
      name: data['name'],
      role: data['role'],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

Future<void> addProject(String name,String des) async {
    await FirebaseFirestore.instance.collection('projects').add({
      'name': name,
      'description': des,
    });
   
  }
  
}

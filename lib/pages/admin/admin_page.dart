import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:niransnarayanan/pages/admin/add_edit.dart';
import 'package:niransnarayanan/data/project.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddEditProjectScreen()),
                );
              },
              child: const Text('Add New Project'),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('projects')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No projects found'));
                  }

                  final projects = snapshot.data!.docs
                      .map((doc) => Project.fromFirestore(doc))
                      .toList();

                  return ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      final _fbImgUrl = project.imgUrl.toString();
                      debugPrint(_fbImgUrl);
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(project.name),
                              subtitle: Text(project.description),
                              trailing: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddEditProjectScreen(
                                        project: project,
                                        projectId:
                                            snapshot.data!.docs[index].id,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            (project.imgUrl != null &&
                                    project.imgUrl!.isNotEmpty)
                                ? Image.network(_fbImgUrl)
                                // ? Image.network("https://picsum.photos/200")
                                : const CircularProgressIndicator(),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

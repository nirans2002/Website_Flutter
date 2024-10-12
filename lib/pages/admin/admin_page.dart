import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';
import 'package:niransnarayanan/pages/admin/add_edit.dart';
import 'package:image_network/image_network.dart';

class AdminPage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

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
                      builder: (context) => AddEditProjectScreen()),
                );
              },
              child: const Text('Add New Project'),
            ),
            Expanded(
              child: StreamBuilder<List<Project>>(
                stream: _firestoreService.getProjects(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final projects = snapshot.data!;
                  return ListView.builder(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      var project = projects[index];
                      return ListTile(
                        title: Text(project.name),
                        subtitle: Text(project.description),
                        leading: project.imgUrl != null
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: CachedNetworkImage(
                                  imageUrl: project.imgUrl!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.red, BlendMode.colorBurn)),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              )
                            : Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey,
                                child: Icon(Icons.image, color: Colors.white),
                              ),
                        trailing: PopupMenuButton<ListTileTitleAlignment>(
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<ListTileTitleAlignment>>[
                            PopupMenuItem<ListTileTitleAlignment>(
                              value: ListTileTitleAlignment.titleHeight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddEditProjectScreen(
                                          project: project,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text('Edit')),
                            ),
                            PopupMenuItem<ListTileTitleAlignment>(
                              value: ListTileTitleAlignment.titleHeight,
                              child: TextButton(
                                  onPressed: () {
                                    _firestoreService
                                        .deleteProject(project.id!);
                                    // _firestoreService.getProjects();
                                  },
                                  child: Text('Delete')),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditProjectScreen(
                                project: project,
                              ),
                            ),
                          );
                        },
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

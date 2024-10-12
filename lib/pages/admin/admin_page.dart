import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/experience.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/data/skill.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';
import 'package:niransnarayanan/pages/admin/add_edit.dart';
import 'package:niransnarayanan/pages/admin/add_exp.dart';
import 'package:niransnarayanan/pages/admin/add_skill.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
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
                    builder: (context) => AdminPageProject(),
                  ),
                );
              },
              child: const Text(
                "Projects Page",
              ),
            ),
            ElevatedButton(
              // AdminPageExperience
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPageExperience(),
                  ),
                );
              },
              child: const Text(
                "Experience Page",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminPageSkill(),
                  ),
                );
              },
              child: const Text(
                "Skills Page",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminPageProject extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  AdminPageProject({super.key});

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
              child: StreamBuilder<List<Project>>(
                stream: _firestoreService.getProjects(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
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
                                          colorFilter: const ColorFilter.mode(
                                              Colors.red, BlendMode.colorBurn)),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              )
                            : Container(
                                width: 50,
                                height: 50,
                                color: Colors.grey,
                                child: const Icon(Icons.image,
                                    color: Colors.white),
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
                                  child: const Text('Edit')),
                            ),
                            PopupMenuItem<ListTileTitleAlignment>(
                              value: ListTileTitleAlignment.titleHeight,
                              child: TextButton(
                                  onPressed: () {
                                    _firestoreService
                                        .deleteProject(project.id!);
                                    // _firestoreService.getProjects();
                                  },
                                  child: const Text('Delete')),
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

// ----------------------------Experience------------------------------------

class AdminPageExperience extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  AdminPageExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page - Experience'),
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
                      builder: (context) => AddEditExperienceScreen()),
                );
              },
              child: const Text('Add New Experience'),
            ),
            Expanded(
              child: StreamBuilder<List<Experience>>(
                stream: _firestoreService.getExperience(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final experiences = snapshot.data!;
                  return ListView.builder(
                    itemCount: experiences.length,
                    itemBuilder: (context, index) {
                      var experience = experiences[index];
                      return ListTile(
                        title: Text(experience.title),
                        subtitle: Text(experience.employmentType!),
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
                                            AddEditExperienceScreen(
                                          experience: experience,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Edit')),
                            ),
                            PopupMenuItem<ListTileTitleAlignment>(
                              value: ListTileTitleAlignment.titleHeight,
                              child: TextButton(
                                  onPressed: () {
                                    _firestoreService
                                        .deleteExperience(experience.id!);
                                    // _firestoreService.getProjects();
                                  },
                                  child: const Text('Delete')),
                            ),
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

// ----------------------------Skill------------------------------------

class AdminPageSkill extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  AdminPageSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page - Skill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddSkillScreen()),
                );
              },
              child: const Text('Add New Skill'),
            ),
            Expanded(
              child: StreamBuilder<List<Skill>>(
                stream: _firestoreService.getSkill(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final skills = snapshot.data!;
                  return ListView.builder(
                    itemCount: skills.length,
                    itemBuilder: (context, index) {
                      var skill = skills[index];
                      return ListTile(
                        title: Text(skill.skill),
                        trailing: PopupMenuButton<ListTileTitleAlignment>(
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<ListTileTitleAlignment>>[
                            PopupMenuItem<ListTileTitleAlignment>(
                              value: ListTileTitleAlignment.titleHeight,
                              child: TextButton(
                                  onPressed: () {
                                    _firestoreService.deleteSkill(skill.id!);
                                  },
                                  child: const Text('Delete')),
                            ),
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

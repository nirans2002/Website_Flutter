import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _firebaseMethods =
      FirebaseMethodsProject(); // Initialize FirebaseMethodsProject

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _githubRepoController = TextEditingController();
  final _liveLinkController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _ytUrlController = TextEditingController();
  final _documentationUrlController = TextEditingController();
  final List<String> _tags = [];
  DateTime? _startDate;
  DateTime? _endDate;

  // Clear form fields after adding or editing a project
  void _clearForm() {
    _nameController.clear();
    _descriptionController.clear();
    _githubRepoController.clear();
    _liveLinkController.clear();
    _imgUrlController.clear();
    _ytUrlController.clear();
    _documentationUrlController.clear();
    _tags.clear();
    _startDate = null;
    _endDate = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: _firebaseMethods
            .getProjectsStream(), // Use the stream method from the new class
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No projects available'));
          }

          var docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var projectDoc = docs[index];
              var project = Project.fromFirestore(projectDoc);

              return ListTile(
                title: Text(project.name),
                subtitle: Text(project.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog(projectDoc.id, project);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        bool confirm = await _confirmDelete(context);
                        if (confirm) {
                          _firebaseMethods.deleteProject(projectDoc
                              .id); // Call delete method from the new class
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog, // Open the form dialog to add a new project
        child: Icon(Icons.add),
      ),
    );
  }

  // Dialog to confirm deletion
  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirm Delete'),
            content: Text('Are you sure you want to delete this project?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;
  }

  // Dialog to add a new project
  void _showAddDialog() {
    _clearForm();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Project'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Project Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Project Description'),
              ),
              // Add more fields as necessary (e.g., GitHub repo, live link, etc.)
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Project newProject = Project(
                name: _nameController.text,
                description: _descriptionController.text,
                githubRepo: _githubRepoController.text,
                liveLink: _liveLinkController.text,
                tags: _tags,
                imgUrl: _imgUrlController.text,
                ytUrl: _ytUrlController.text,
                documentationUrl: _documentationUrlController.text,
                startDate: _startDate,
                endDate: _endDate,
                otherContributors: [], // Add contributors if needed
              );
              _firebaseMethods.addProject(
                  newProject); // Use add method from FirebaseMethodsProject class
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  // Dialog to edit an existing project
  void _showEditDialog(String projectId, Project project) {
    _nameController.text = project.name;
    _descriptionController.text = project.description;
    _githubRepoController.text = project.githubRepo ?? '';
    _liveLinkController.text = project.liveLink ?? '';
    _imgUrlController.text = project.imgUrl ?? '';
    _ytUrlController.text = project.ytUrl ?? '';
    _documentationUrlController.text = project.documentationUrl ?? '';
    _tags.addAll(project.tags.cast<String>());
    _startDate = project.startDate;
    _endDate = project.endDate;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Project'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Project Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Project Description'),
              ),
              // Add more fields here for GitHub repo, live link, etc.
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Project updatedProject = Project(
                name: _nameController.text,
                description: _descriptionController.text,
                githubRepo: _githubRepoController.text,
                liveLink: _liveLinkController.text,
                tags: _tags,
                imgUrl: _imgUrlController.text,
                ytUrl: _ytUrlController.text,
                documentationUrl: _documentationUrlController.text,
                startDate: _startDate,
                endDate: _endDate,
                otherContributors: [], // Add or update contributors if necessary
              );
              _firebaseMethods.editProject(projectId,
                  updatedProject); // Use edit method from the new class
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

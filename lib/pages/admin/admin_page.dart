import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Add a new project
  Future<void> _addProject() async {
    await FirebaseFirestore.instance.collection('projects').add({
      'name': _nameController.text,
      'description': _descriptionController.text,
    });
    _nameController.clear();
    _descriptionController.clear();
  }

  // Update an existing project
  Future<void> _editProject(
      String projectId, String newName, String newDescription) async {
    await FirebaseFirestore.instance
        .collection('projects')
        .doc(projectId)
        .update({
      'name': newName,
      'description': newDescription,
    });
  }

  // Delete a project
  Future<void> _deleteProject(String projectId) async {
    await FirebaseFirestore.instance
        .collection('projects')
        .doc(projectId)
        .delete();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Project Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Project Description'),
            ),
          ),
          ElevatedButton(
            onPressed: _addProject,
            child: Text('Add Project'),
          ),
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('projects').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                var docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    var project = docs[index];
                    return ListTile(
                      title: Text(project['name']),
                      subtitle: Text(project['description']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit Button
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Show a dialog to edit the project
                              _showEditDialog(project.id, project['name'],
                                  project['description']);
                            },
                          ),
                          // Delete Button
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              // Confirm deletion
                              bool confirm = await _confirmDelete(context);
                              if (confirm) {
                                _deleteProject(project.id);
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
          ),
        ],
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

  // Dialog to edit a project
  void _showEditDialog(
      String projectId, String currentName, String currentDescription) {
    _nameController.text = currentName;
    _descriptionController.text = currentDescription;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Project'),
        content: Column(
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
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _editProject(
                  projectId, _nameController.text, _descriptionController.text);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

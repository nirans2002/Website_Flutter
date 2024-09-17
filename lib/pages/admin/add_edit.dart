import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html; // Import for web support
import 'package:niransnarayanan/data/project.dart';

class AddEditProjectScreen extends StatefulWidget {
  final Project? project;
  final String? projectId;

  const AddEditProjectScreen({Key? key, this.project, this.projectId})
      : super(key: key);

  @override
  _AddEditProjectScreenState createState() => _AddEditProjectScreenState();
}

class _AddEditProjectScreenState extends State<AddEditProjectScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _githubRepoController = TextEditingController();
  final _liveLinkController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _ytUrlController = TextEditingController();
  final _documentationUrlController = TextEditingController();
  List<String> _tags = [];
  DateTime? _startDate;
  DateTime? _endDate;
  List<Contributor> _contributors = [];
  Uint8List? _imageBytes;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    if (widget.project != null) {
      _prepopulateForm(widget.project!);
    }
  }

  void _prepopulateForm(Project project) {
    _nameController.text = project.name;
    _descriptionController.text = project.description;
    _githubRepoController.text = project.githubRepo ?? '';
    _liveLinkController.text = project.liveLink ?? '';
    _imgUrlController.text = project.imgUrl ?? '';
    _ytUrlController.text = project.ytUrl ?? '';
    _documentationUrlController.text = project.documentationUrl ?? '';
    _tags = List<String>.from(project.tags);
    _startDate = project.startDate;
    _endDate = project.endDate;
    _contributors = project.otherContributors ?? [];
  }

  Future<void> _uploadImage() async {
    if (_imageBytes != null) {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('project_images')
          .child(DateTime.now().toIso8601String());
      final uploadTask = storageRef.putData(_imageBytes!);

      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        _imageUrl = downloadUrl;
        _imgUrlController.text = downloadUrl;
      });
    }
  }

  void _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
      await _uploadImage();
    }
  }

  void _saveProject() async {
    final project = Project(
      name: _nameController.text,
      description: _descriptionController.text,
      githubRepo: _githubRepoController.text.isNotEmpty
          ? _githubRepoController.text
          : null,
      liveLink:
          _liveLinkController.text.isNotEmpty ? _liveLinkController.text : null,
      tags: _tags,
      imgUrl: _imgUrlController.text.isNotEmpty ? _imgUrlController.text : null,
      ytUrl: _ytUrlController.text.isNotEmpty ? _ytUrlController.text : null,
      documentationUrl: _documentationUrlController.text.isNotEmpty
          ? _documentationUrlController.text
          : null,
      startDate: _startDate,
      endDate: _endDate,
      otherContributors: _contributors,
    );

    if (widget.projectId != null) {
      // Update existing project
      await FirebaseFirestore.instance
          .collection('projects')
          .doc(widget.projectId)
          .update(project.toMap());
    } else {
      // Add new project
      await FirebaseFirestore.instance
          .collection('projects')
          .add(project.toMap());
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project == null ? 'Add Project' : 'Edit Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Project Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              TextField(
                controller: _githubRepoController,
                decoration: const InputDecoration(labelText: 'GitHub Repo'),
              ),
              TextField(
                controller: _liveLinkController,
                decoration: const InputDecoration(labelText: 'Live Link'),
              ),
              TextField(
                controller: _ytUrlController,
                decoration: const InputDecoration(labelText: 'YouTube URL'),
              ),
              TextField(
                controller: _documentationUrlController,
                decoration:
                    const InputDecoration(labelText: 'Documentation URL'),
              ),
              TextField(
                controller: _imgUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                readOnly: true,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _selectImage,
                child: const Text('Select Image'),
              ),
              SizedBox(height: 10),
              _imageBytes != null
                  ? Image.memory(_imageBytes!, height: 100)
                  : _imgUrlController.text.isNotEmpty
                      ? Image.network(_imgUrlController.text, height: 100)
                      : const Text('No image selected'),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                children: _tags.map((tag) => Chip(label: Text(tag))).toList(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Add Tag'),
                onSubmitted: (value) {
                  setState(() {
                    if (value.isNotEmpty && !_tags.contains(value)) {
                      _tags.add(value);
                    }
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contributors:'),
                  ..._contributors.map((contributor) => ListTile(
                        title: Text(contributor.name),
                        subtitle: Text(contributor.linkedinProfileLink),
                      )),
                ],
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Contributor Name'),
                onSubmitted: (name) {
                  // Add contributor logic
                },
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Contributor LinkedIn URL'),
                onSubmitted: (link) {
                  // Add contributor logic
                },
              ),
              ElevatedButton(
                onPressed: _saveProject,
                child: Text(
                    widget.project == null ? 'Add Project' : 'Update Project'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

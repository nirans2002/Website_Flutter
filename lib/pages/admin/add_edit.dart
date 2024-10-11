import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:html' as html; // Import for web support
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';

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
  final _ytUrlController = TextEditingController();
  final _documentationUrlController = TextEditingController();
  List<String> _tags = [];
  DateTime? _startDate;
  DateTime? _endDate;
  List<Contributor> _contributors = [];
  Uint8List? _imageBytes;
  String? _imageUrl;
  bool _isLoading = false;

  final _contributorNameController = TextEditingController();
  final _contributorLinkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.project != null) {
      _prepopulateForm(widget.project!);
    }
    _isLoading = false;
  }

  void _prepopulateForm(Project project) {
    _nameController.text = project.name;
    _descriptionController.text = project.description;
    _githubRepoController.text = project.githubRepo ?? '';
    _liveLinkController.text = project.liveLink ?? '';
    _ytUrlController.text = project.ytUrl ?? '';
    _documentationUrlController.text = project.documentationUrl ?? '';
    _tags = List<String>.from(project.tags);
    _startDate = project.startDate;
    _endDate = project.endDate;
    _contributors = project.otherContributors ?? [];
    _imageUrl = project.imgUrl; // Update image URL
  }

  Future<void> _uploadImage() async {
    setState(() {
      _isLoading = true;
    });
    if (_imageBytes != null) {
      final downloadUrl =
          await FirebaseMethodsProject().uploadImageToStorage(_imageBytes!);
      setState(() {
        _imageUrl = downloadUrl;
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
    }
  }

  void _addContributor() {
    final name = _contributorNameController.text;
    final link = _contributorLinkController.text;

    if (name.isNotEmpty && link.isNotEmpty) {
      setState(() {
        _contributors.add(Contributor(name: name, linkedinProfileLink: link));
        _contributorNameController.clear();
        _contributorLinkController.clear();
      });
    }
  }

  void _removeContributor(int index) {
    setState(() {
      _contributors.removeAt(index);
    });
  }

  void _saveProject() async {
    await _uploadImage();
    final project = Project(
      name: _nameController.text,
      description: _descriptionController.text,
      githubRepo: _githubRepoController.text.isNotEmpty
          ? _githubRepoController.text
          : null,
      liveLink:
          _liveLinkController.text.isNotEmpty ? _liveLinkController.text : null,
      tags: _tags,
      imgUrl: _imageUrl,
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
    setState(() {
      _isLoading = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.project?.imgUrl);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project == null ? 'Add Project' : 'Edit Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 10),
              _imageBytes != null
                  ? Image.memory(_imageBytes!, height: 100)
                  : const Text('No image selected'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _selectImage,
                child: const Text('Select Image'),
              ),
              widget.project != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(widget.project!.imgUrl!),
                    )
                  : const Text('No image'),
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
              SizedBox(height: 10),
              Text('Contributors:'),
              Column(
                children: _contributors.map((contributor) {
                  final index = _contributors.indexOf(contributor);
                  return ListTile(
                    title: Text(contributor.name),
                    subtitle: Text(contributor.linkedinProfileLink),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeContributor(index),
                    ),
                  );
                }).toList(),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _contributorNameController,
                      decoration:
                          const InputDecoration(labelText: 'Contributor Name'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _contributorLinkController,
                      decoration: const InputDecoration(
                          labelText: 'Contributor LinkedIn URL'),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _addContributor,
                child: const Text('Add Contributor'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProject,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text(widget.project == null
                        ? 'Add Project'
                        : 'Update Project'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

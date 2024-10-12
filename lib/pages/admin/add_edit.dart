import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';

class AddEditProjectScreen extends StatefulWidget {
  final Project? project;

  AddEditProjectScreen({this.project});

  @override
  _AddEditProjectScreenState createState() => _AddEditProjectScreenState();
}

class _AddEditProjectScreenState extends State<AddEditProjectScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _description;
  String? _githubRepo;
  String? _liveLink;
  List<String> _tags = [];
  String? _imgUrl;
  String? _ytUrl;
  String? _documentationUrl;
  DateTime? _startDate;
  DateTime? _endDate;
  List<Contributor>? _contributors = [];
  String? _imageFilePath; // Path for image file on Windows

  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    if (widget.project != null) {
      _name = widget.project!.name;
      _description = widget.project!.description;
      _githubRepo = widget.project!.githubRepo;
      _liveLink = widget.project!.liveLink;
      _tags = List<String>.from(widget.project!.tags);
      _imgUrl = widget.project!.imgUrl;
      _ytUrl = widget.project!.ytUrl;
      _documentationUrl = widget.project!.documentationUrl;
      _startDate = widget.project!.startDate;
      _endDate = widget.project!.endDate;
      _contributors = widget.project!.otherContributors;
    }
  }

  // Method to pick an image from the file picker
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _imageFilePath = result.files.single.path!;
      });
    }
  }

  // Method to upload the image and get the URL
  Future<void> _uploadImage() async {
    if (_imageFilePath != null) {
      _imgUrl = await _firestoreService.uploadImageToStorage(_imageFilePath!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project == null ? 'Add Project' : 'Edit Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Project Name'),
                onSaved: (value) => _name = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a project name';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => _description = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _githubRepo,
                decoration: InputDecoration(labelText: 'GitHub Repository'),
                onSaved: (value) => _githubRepo = value,
              ),
              TextFormField(
                initialValue: _liveLink,
                decoration: InputDecoration(labelText: 'Live Link'),
                onSaved: (value) => _liveLink = value,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Tags (comma separated)'),
                initialValue: _tags.join(', '),
                onSaved: (value) {
                  _tags = value!.split(',').map((e) => e.trim()).toList();
                },
              ),
              SizedBox(height: 20),
              // Image Upload Section
              Text('Image:'),
              _imageFilePath == null && _imgUrl == null
                  ? Text('No Image Selected')
                  : _imageFilePath != null
                      ? Text(
                          'Selected File: $_imageFilePath') // Show image file path
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.network(
                            _imgUrl!,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
              TextButton.icon(
                icon: Icon(Icons.image),
                label: Text('Pick Image'),
                onPressed: _pickImage,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(widget.project == null ? 'Add' : 'Update'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await _uploadImage(); // Upload image before saving

                    Project project = Project(
                      id: widget.project?.id, // Pass the document ID for update
                      name: _name!,
                      description: _description!,
                      githubRepo: _githubRepo,
                      liveLink: _liveLink,
                      tags: _tags,
                      imgUrl: _imgUrl, // Save image URL to Firestore
                      ytUrl: _ytUrl,
                      documentationUrl: _documentationUrl,
                      startDate: _startDate,
                      endDate: _endDate,
                      otherContributors: _contributors,
                    );

                    if (widget.project == null) {
                      await _firestoreService.addProject(project);
                    } else {
                      await _firestoreService.updateProject(
                          project.id!, project);
                    }
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

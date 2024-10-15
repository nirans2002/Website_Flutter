import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';
import 'package:file_picker/file_picker.dart';

class AddEditProjectScreen extends StatefulWidget {
  final Project? project;

  const AddEditProjectScreen({super.key, this.project});

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
  List<Contributor> _contributors = [];
  String? _imageFilePath;

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
      _contributors = widget.project!.otherContributors ?? [];
    }
  }

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

  Future<void> _uploadImage() async {
    if (_imageFilePath != null) {
      _imgUrl = await _firestoreService.uploadImageToStorage(_imageFilePath!);
    }
  }

  void _addContributor() {
    setState(() {
      _contributors.add(Contributor(name: '', linkedinProfileLink: ''));
    });
  }

  void _removeContributor(int index) {
    setState(() {
      _contributors.removeAt(index);
    });
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? (_startDate ?? DateTime.now())
          : (_endDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
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
                decoration: const InputDecoration(
                  labelText: 'Project Name',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
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
                decoration: const InputDecoration(
                  labelText: 'GitHub Repository',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onSaved: (value) => _githubRepo = value,
              ),
              TextFormField(
                initialValue: _liveLink,
                decoration: const InputDecoration(
                  labelText: 'Live Link',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onSaved: (value) => _liveLink = value,
              ),
              const SizedBox(height: 20),

              // Start Date and End Date pickers
              ListTile(
                title: Text(
                  'Start Date: ${_startDate != null ? _startDate.toString().split(' ')[0] : 'Select Date'}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: Text(
                  'End Date: ${_endDate != null ? _endDate.toString().split(' ')[0] : 'Select Date'}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tags (comma separated)',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                initialValue: _tags.join(', '),
                onSaved: (value) {
                  _tags = value!.split(',').map((e) => e.trim()).toList();
                },
              ),
              const SizedBox(height: 20),
              const Text('Image:'),
              _imageFilePath == null && _imgUrl == null
                  ? const Text(
                      'No Image Selected',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  : _imageFilePath != null
                      ? Text(
                          'Selected File: $_imageFilePath',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : Image.network(_imgUrl!),
              TextButton.icon(
                icon: const Icon(Icons.image),
                label: const Text('Pick Image'),
                onPressed: _pickImage,
              ),
              const SizedBox(height: 20),

              // Contributors section
              const Text('Contributors:'),
              ..._contributors.asMap().entries.map((entry) {
                int index = entry.key;
                Contributor contributor = entry.value;

                return Column(
                  key: ValueKey(contributor),
                  children: [
                    TextFormField(
                      initialValue: contributor.name,
                      decoration: const InputDecoration(
                        labelText: 'Contributor Name',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) => contributor.name = value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a contributor name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      initialValue: contributor.linkedinProfileLink,
                      decoration: const InputDecoration(
                        labelText: 'LinkedIn Profile Link',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) =>
                          contributor.linkedinProfileLink = value,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Remove'),
                          onPressed: () => _removeContributor(index),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }).toList(),
              TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Contributor'),
                onPressed: _addContributor,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(widget.project == null ? 'Add' : 'Update'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await _uploadImage();

                    Project project = Project(
                      name: _name!,
                      description: _description!,
                      githubRepo: _githubRepo,
                      liveLink: _liveLink,
                      tags: _tags,
                      imgUrl: _imgUrl,
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
                          widget.project!.id!, widget.project!);
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

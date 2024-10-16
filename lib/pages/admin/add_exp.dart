import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/experience.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';

import 'package:file_picker/file_picker.dart';

class AddEditExperienceScreen extends StatefulWidget {

  const AddEditExperienceScreen({super.key, this.experience});
  final Experience? experience;

  
  @override
  State<AddEditExperienceScreen> createState() => _AddEditExperienceScreenState();
}


class _AddEditExperienceScreenState extends State<AddEditExperienceScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _description;
  String? _employmentType;
  String? _companyName;
  String? _companyImgUrl;
  bool _isCurrentlyWorking = false;
  DateTime? _startdate;
  DateTime? _enddate;
  String? _location;
  String? _imageFilePath;

  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    if (widget.experience != null) {
      _title = widget.experience!.title;
      _description = widget.experience!.description;
      _employmentType = widget.experience!.employmentType;
      _companyName = widget.experience!.companyName;
      _companyImgUrl = widget.experience!.companyImgUrl;
      _isCurrentlyWorking = widget.experience!.isCurrentlyWorking;
      _startdate = widget.experience!.startdate;
      _enddate = widget.experience!.enddate;
      _location = widget.experience!.location;
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
      _companyImgUrl =
          await _firestoreService.uploadImageToStorage(_imageFilePath!);
    }
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? (_startdate ?? DateTime.now())
          : (_enddate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startdate : _enddate)) {
      setState(() {
        if (isStartDate) {
          _startdate = picked;
        } else {
          _enddate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.experience == null ? 'Add Experience' : 'Edit Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                onSaved: (value) => _title = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _description,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                onSaved: (value) => _description = value,
              ),
              TextFormField(
                initialValue: _employmentType,
                decoration: const InputDecoration(
                  labelText: 'Employment Type',
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                onSaved: (value) => _employmentType = value,
              ),
              TextFormField(
                initialValue: _companyName,
                decoration: const InputDecoration(
                  labelText: 'Company Name',
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                onSaved: (value) => _companyName = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _location,
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                onSaved: (value) => _location = value,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isCurrentlyWorking,
                    onChanged: (bool? value) {
                      setState(() {
                        _isCurrentlyWorking = value ?? false;
                      });
                    },
                  ),
                  const Text(
                    'Currently Working',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Start Date: ${_startdate != null ? _startdate.toString().split(' ')[0] : 'Select Date'}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: Text(
                  'End Date: ${_enddate != null ? _enddate.toString().split(' ')[0] : 'Select Date'}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              const SizedBox(height: 20),
              const Text('Company Logo:'),
              _imageFilePath == null && _companyImgUrl == null
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
                      : Image.network(_companyImgUrl!),
              TextButton.icon(
                icon: const Icon(Icons.image),
                label: const Text(
                  'Pick Image',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: _pickImage,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: Text(widget.experience == null ? 'Add' : 'Update'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await _uploadImage();

                    Experience experience = Experience(
                      title: _title!,
                      description: _description,
                      employmentType: _employmentType,
                      companyName: _companyName!,
                      companyImgUrl: _companyImgUrl,
                      isCurrentlyWorking: _isCurrentlyWorking,
                      startdate: _startdate,
                      enddate: _enddate,
                      location: _location!,
                    );

                    if (widget.experience == null) {
                      await _firestoreService.addExperience(experience);
                    } else {
                      await _firestoreService.updateExperience(
                          experience.id!, widget.experience!);
                    }
                    if (!context.mounted) return;

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

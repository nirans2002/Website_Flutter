import 'package:flutter/material.dart';
import 'package:niransnarayanan/data/skill.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';

class AddSkillScreen extends StatefulWidget {
  const AddSkillScreen({super.key});

  @override
  State<AddSkillScreen> createState() => _AddSkillScreenState();
}

class _AddSkillScreenState extends State<AddSkillScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _skill;

  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Skill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Skill',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onSaved: (value) => _skill = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a skill';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Add Skill'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Skill skill = Skill(skill: _skill!);
                    await _firestoreService.addSkill(skill);
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

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:niransnarayanan/data/project.dart';
import 'package:niransnarayanan/firebase/firebase_services.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  final _firebaseMethods =
      FirebaseMethodsProject(); // Initialize FirebaseMethodsProject
  late TabController _tabController;

  // Controllers for project fields
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _githubRepoController = TextEditingController();
  final _liveLinkController = TextEditingController();
  final _imgUrlController = TextEditingController();
  final _ytUrlController = TextEditingController();
  final _documentationUrlController = TextEditingController();
  List<String> _tags = [];
  final _tagController = TextEditingController();
  List<Contributor> _otherContributors = [];
  final _contributorNameController = TextEditingController();
  final _contributorLinkedInController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
    _otherContributors.clear();
  }

  // Helper to show date picker for start and end date
  Future<void> _pickDate(BuildContext context, bool isStartDate) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
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
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Projects'),
            Tab(text: 'Experiences'),
            Tab(text: 'Skills'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildProjectsTab(),
          _buildExperiencesTab(),
          _buildSkillsTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {
                _showAddDialogProject();
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  // Tab 1: Projects (with CRUD functionality)
  Widget _buildProjectsTab() {
    return StreamBuilder(
      stream: _firebaseMethods.getProjectsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No projects available'));
        }

        var docs = snapshot.data!.docs;
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            var projectDoc = docs[index];
            var project = Project.fromFirestore(projectDoc);

            return Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          project.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showEditDialogProject(projectDoc.id, project);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                bool confirm =
                                    await _confirmDeleteProject(context);
                                if (confirm) {
                                  _firebaseMethods.deleteProject(projectDoc.id);
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    Text(
                      project.description,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Tab 2: Experiences (static content for now)
  Widget _buildExperiencesTab() {
    return const Center(
      child: Text(
        'Experience management coming soon!',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Tab 3: Skills (static content for now)
  Widget _buildSkillsTab() {
    return const Center(
      child: Text(
        'Skill management coming soon!',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Dialog to confirm deletion
  Future<bool> _confirmDeleteProject(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirm Delete'),
            content:
                const Text('Are you sure you want to delete this project?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;
  }

  // Dialog to add a new project
  void _showAddDialogProject() {
    _clearForm(); // Clear form data for a fresh entry
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Project'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextFields for project attributes
              _buildTextField(_nameController, 'Project Name'),
              _buildTextField(_descriptionController, 'Project Description'),
              _buildTextField(_githubRepoController, 'GitHub Repo'),
              _buildTextField(_liveLinkController, 'Live Link'),
              _buildTextField(_imgUrlController, 'Image URL'),
              _buildTextField(_ytUrlController, 'YouTube URL'),
              _buildTextField(
                  _documentationUrlController, 'Documentation Link'),
              const SizedBox(height: 10),

              // Date pickers for start and end date
              _buildDatePicker(context, isStartDate: true),
              _buildDatePicker(context, isStartDate: false),

              const SizedBox(height: 10),
              _buildTagsSection(),
              const Divider(),
              _buildContributorsSection(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Project newProject = Project(
                name: _nameController.text,
                description: _descriptionController.text,
                githubRepo: _githubRepoController.text,
                liveLink: _liveLinkController.text,
                imgUrl: _imgUrlController.text,
                ytUrl: _ytUrlController.text,
                documentationUrl: _documentationUrlController.text,
                tags: _tags,
                startDate: _startDate,
                endDate: _endDate,
                otherContributors: _otherContributors,
              );
              _firebaseMethods.addProject(newProject);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _prepopulateForm(Project project) {
    _nameController.text = project.name;
    _descriptionController.text = project.description;
    _githubRepoController.text = project.githubRepo ?? '';
    _liveLinkController.text = project.liveLink ?? '';
    _imgUrlController.text = project.imgUrl ?? '';
    _ytUrlController.text = project.ytUrl ?? '';
    _documentationUrlController.text = project.documentationUrl ?? '';

    // Prepopulate start and end dates
    _startDate = project.startDate;
    _endDate = project.endDate;

    // Prepopulate tags
    _tags = List<String>.from(project.tags ?? []);

    // Prepopulate contributors
    _otherContributors =
        List<Contributor>.from(project.otherContributors ?? []);

    // Clear the temporary form fields for contributors
    _contributorNameController.clear();
    _contributorLinkedInController.clear();
  }

// Dialog to edit an existing project
  // Dialog to edit an existing project
  void _showEditDialogProject(String projectId, Project project) {
    _prepopulateForm(project); // Fill form with project data

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Project'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(_nameController, 'Project Name'),
              _buildTextField(_descriptionController, 'Project Description'),
              _buildTextField(_githubRepoController, 'GitHub Repo'),
              _buildTextField(_liveLinkController, 'Live Link'),
              _buildTextField(_imgUrlController, 'Image URL'),
              _buildTextField(_ytUrlController, 'YouTube URL'),
              _buildTextField(
                  _documentationUrlController, 'Documentation Link'),
              const SizedBox(height: 10),

              // Date pickers for start and end date
              _buildDatePicker(context, isStartDate: true),
              _buildDatePicker(context, isStartDate: false),

              const SizedBox(height: 10),
              _buildTagsSection(),
              const Divider(),
              _buildContributorsSection(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Project updatedProject = Project(
                name: _nameController.text,
                description: _descriptionController.text,
                githubRepo: _githubRepoController.text,
                liveLink: _liveLinkController.text,
                imgUrl: _imgUrlController.text,
                ytUrl: _ytUrlController.text,
                documentationUrl: _documentationUrlController.text,
                tags: _tags,
                startDate: _startDate,
                endDate: _endDate,
                otherContributors: _otherContributors,
              );
              _firebaseMethods.editProject(projectId, updatedProject);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _buildDatePicker(BuildContext context, {required bool isStartDate}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(isStartDate ? 'Start Date: ' : 'End Date: '),
        TextButton(
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: isStartDate
                  ? (_startDate ?? DateTime.now())
                  : (_endDate ?? DateTime.now()),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              setState(() {
                if (isStartDate) {
                  _startDate = pickedDate;
                } else {
                  _endDate = pickedDate;
                }
              });
            }
          },
          child: Text(
            (isStartDate ? _startDate : _endDate) != null
                ? DateFormat('yyyy-MM-dd')
                    .format(isStartDate ? _startDate! : _endDate!)
                : 'Pick a date',
            style: const TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildTagsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _tagController,
          decoration: const InputDecoration(labelText: 'Add Tag'),
          onSubmitted: (tag) {
            setState(() {
              _tags.add(tag);
              _tagController.clear();
            });
          },
        ),
        Wrap(
          spacing: 8,
          children: _tags
              .map((tag) => Chip(
                    label: Text(tag),
                    onDeleted: () {
                      setState(() {
                        _tags.remove(tag);
                      });
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildContributorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contributors'),
        TextField(
          controller: _contributorNameController,
          decoration: const InputDecoration(labelText: 'Contributor Name'),
        ),
        TextField(
          controller: _contributorLinkedInController,
          decoration: const InputDecoration(labelText: 'LinkedIn Profile'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _otherContributors.add(Contributor(
                name: _contributorNameController.text,
                linkedinProfileLink: _contributorLinkedInController.text,
              ));
              _contributorNameController.clear();
              _contributorLinkedInController.clear();
            });
          },
          child: const Text('Add Contributor'),
        ),
        Wrap(
          spacing: 8,
          children: _otherContributors
              .map((contributor) => Chip(
                    label: Text(
                        '${contributor.name} (${contributor.linkedinProfileLink})'),
                    onDeleted: () {
                      setState(() {
                        _otherContributors.remove(contributor);
                      });
                    },
                  ))
              .toList(),
        ),
      ],
    );
  }
}

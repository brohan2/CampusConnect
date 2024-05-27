import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Map<String, dynamic> user = {
    'name': 'Alice Johnson',
    'skills': ['Python', 'Flutter', 'Dart'],
    'experience': [
      {
        'title': 'Intern',
        'company': 'Tech Corp',
        'duration': 'June 2023 - Present'
      },
      {
        'title': 'Research Assistant',
        'company': 'University Lab',
        'duration': 'Sep 2022 - May 2023'
      }
    ],
    'connections': ['Bob', 'Charlie', 'Dana'],
  };

  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _connectionController = TextEditingController();
  final TextEditingController _experienceTitleController =
      TextEditingController();
  final TextEditingController _experienceCompanyController =
      TextEditingController();
  final TextEditingController _experienceDurationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildProfileHeader(),
            _buildSkillsSection(),
            _buildExperienceSection(),
            _buildConnectionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.orange,
          child: Text(
            user['name'][0],
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
        SizedBox(height: 10),
        Text(
          user['name'],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          'Senior - Computer Science',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _buildSkillsSection() {
    return Card(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Skills',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _showAddSkillDialog(),
                ),
              ],
            ),
            SizedBox(height: 4),
            Wrap(
              spacing: 5.0,
              children: user['skills'].map<Widget>((skill) {
                return Chip(
                  label: Text(skill),
                  backgroundColor: Color.fromARGB(255, 241, 239, 235),
                  onDeleted: () {
                    setState(() {
                      user['skills'].remove(skill);
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Card(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Work Experience',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _showAddExperienceDialog(),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              children: user['experience'].map<Widget>((exp) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(exp['title'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${exp['company']} - ${exp['duration']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        user['experience'].remove(exp);
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectionsSection() {
    return Card(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Connections',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _showAddConnectionDialog(),
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              children: user['connections'].map<Widget>((connection) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(connection),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        user['connections'].remove(connection);
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddSkillDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Skill'),
          content: TextField(
            controller: _skillController,
            decoration: InputDecoration(
              labelText: 'Skill',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  user['skills'].add(_skillController.text);
                  _skillController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddConnectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Connection'),
          content: TextField(
            controller: _connectionController,
            decoration: InputDecoration(
              labelText: 'Connection Name',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  user['connections'].add(_connectionController.text);
                  _connectionController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showAddExperienceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Experience'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _experienceTitleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: _experienceCompanyController,
                decoration: InputDecoration(
                  labelText: 'Company',
                ),
              ),
              TextField(
                controller: _experienceDurationController,
                decoration: InputDecoration(
                  labelText: 'Duration',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  user['experience'].add({
                    'title': _experienceTitleController.text,
                    'company': _experienceCompanyController.text,
                    'duration': _experienceDurationController.text,
                  });
                  _experienceTitleController.clear();
                  _experienceCompanyController.clear();
                  _experienceDurationController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

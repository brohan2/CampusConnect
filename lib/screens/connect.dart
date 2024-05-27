import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  const Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  String selectedSection = '';

  final List<Map<String, dynamic>> users = [
    {
      'name': 'Alice',
      'year': 'Senior',
      'major': 'Computer Science',
      'interests': ['AI', 'Machine Learning'],
      'skills': ['Python', 'Flutter'],
      'job': 'Intern at Tech Corp',
      'field': 'Placements'
    },
    {
      'name': 'Bob',
      'year': 'Junior',
      'major': 'Electrical Engineering',
      'interests': ['Robotics', 'IoT'],
      'skills': ['C++', 'Embedded Systems'],
      'job': 'Research Assistant',
      'field': 'Clubs'
    },
    {
      'name': 'Charlie',
      'year': 'Sophomore',
      'major': 'Mechanical Engineering',
      'interests': ['Sports', 'Fitness'],
      'skills': ['Leadership', 'Teamwork'],
      'job': 'Team Captain',
      'field': 'Sports'
    },
    {
      'name': 'Dana',
      'year': 'Freshman',
      'major': 'Business Administration',
      'interests': ['Events', 'Management'],
      'skills': ['Event Planning', 'Public Speaking'],
      'job': 'Event Coordinator',
      'field': 'Events'
    },
    // Add more dummy users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connections',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: selectedSection.isEmpty ? _buildSectionView() : _buildUserList(),
    );
  }

  Widget _buildSectionView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSectionCard('Placements', 'images/placements.jpeg'),
          _buildSectionCard('Clubs', 'images/clubs.png'),
          _buildSectionCard('Events', 'images/events.png'),
          _buildSectionCard('Sports', 'images/sports.png'),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String section, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSection = section;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedSection = section;
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 58, 86, 156),
                backgroundColor:
                    Color.fromARGB(255, 246, 246, 248), // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              ),
              child: Text(
                section,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList() {
    List<Map<String, dynamic>> filteredUsers = users.where((user) {
      return user['field'] == selectedSection;
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    selectedSection = '';
                  });
                },
              ),
              SizedBox(width: 8),
              Text(
                selectedSection,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredUsers.length,
            itemBuilder: (context, index) {
              return _buildUserCard(filteredUsers[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(user['name'][0],
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              title: Text(user['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text('${user['year']} - ${user['major']}'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  // Handle connect/follow/unfollow actions here
                  print('$value selected');
                },
                itemBuilder: (BuildContext context) {
                  return {'Connect', 'Follow', 'Unfollow'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ),
            SizedBox(height: 8),
            Text('Skills: ${user['skills'].join(', ')}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text('Job: ${user['job']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

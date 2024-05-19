import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/Designer.png'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'johndoe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            _buildProfileListItem(Icons.person, 'Edit Profile', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
            }),
            _buildProfileListItem(Icons.security, 'Privacy Settings', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacySettings()),
              );
              // Navigate to Privacy Settings screen
            }),
            _buildProfileListItem(Icons.notifications, 'Notifications', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
              // Navigate to Notifications screen
            }),
            _buildProfileListItem(Icons.help, 'Help & Support', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpAndSupport()),
              );
              // Navigate to Help & Support screen
            }),
            _buildProfileListItem(Icons.logout, 'Logout', () {
              // Perform logout action
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileListItem(
      IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.restore),
            onPressed: () {
              // Reset profile
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your first name',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Last Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your last name',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Mobile',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your mobile number',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Skills',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your skills',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Internships',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your internships',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Job Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your job title',
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 100, // Adjust width as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Save changes and navigate back to profile
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrivacySettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings'),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchTile('Allow location sharing', false),
            _buildSwitchTile('Allow email notifications', true),
            _buildSwitchTile('Allow push notifications', true),
            // Add more privacy settings as needed
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool initialValue) {
    return SwitchListTile(
      title: Text(title),
      value: initialValue,
      onChanged: (value) {
        // Handle privacy setting change
      },
    );
  }
}

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchTile('Email notifications', true),
            _buildSwitchTile('Push notifications', true),
            _buildSwitchTile('In-app notifications', true),
            // Add more notification settings as needed
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool initialValue) {
    return SwitchListTile(
      title: Text(title),
      value: initialValue,
      onChanged: (value) {
        // Handle notification setting change
      },
    );
  }
}

class HelpAndSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFAQItem('How to reset password?', 'FAQ1'),
            _buildFAQItem('How to contact support?', 'FAQ2'),
            _buildFAQItem('How to use the app?', 'FAQ3'),
            // Add more FAQ items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Answer: This is the answer to $answer',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

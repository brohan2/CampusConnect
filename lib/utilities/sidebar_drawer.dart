import 'package:flutter/material.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({
    super.key,
    required this.drawerHeaderHeight,
  });

  final double drawerHeaderHeight;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: drawerHeaderHeight,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.connect_without_contact),
            title: Text('Connect'),
            onTap: () {
              Navigator.pushNamed(context, '/connect');
            },
          ),
          ListTile(
            leading: Icon(Icons.forum),
            title: Text('Threads'),
            onTap: () {
              Navigator.pushNamed(context, '/threads');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          // Add more ListTile widgets for additional items in the sidebar
        ],
      ),
    );
  }
}
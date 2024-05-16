import 'package:flutter/material.dart';

class sidebar_drawer extends StatelessWidget {
  const sidebar_drawer({
    super.key,
    required this.drawerHeaderHeight,
  });

  final double drawerHeaderHeight;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:[
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
            title: Text('Home'),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              // Handle item 2 tap
            },
          ),
          // Add more ListTile widgets for additional items in the sidebar
        ],
      ),
    
          );
  }
}
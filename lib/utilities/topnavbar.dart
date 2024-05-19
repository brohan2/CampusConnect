import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppBarDefault extends StatelessWidget implements PreferredSizeWidget{
  const AppBarDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar( 
     title: Text("Campus Connect"),
     backgroundColor: Colors.orange,
     centerTitle: true,
     toolbarHeight: 80,
     
     shape: ContinuousRectangleBorder(
       borderRadius: BorderRadius.only(
         bottomLeft: Radius.circular(200),
       )
     ),
     
     leading: Builder(
         builder: (BuildContext context) {
           return IconButton(
             icon: Icon(Icons.menu),
             onPressed: () {
               Scaffold.of(context).openDrawer(); // Open the drawer on button press
             },
           );
         },
     ),
          );
  }
    Size get preferredSize => Size.fromHeight(80); // Adjust the height as needed

}
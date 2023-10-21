import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageURL="https://www.google.co.in/url?sa=i&url=https%3A%2F%2Fwww.visualpharm.com%2Ffree-icons%2Fadmin-595b40b65ba036ed117d3b23&psig=AOvVaw2NzGfk6LbhWx0M-K-JrcOY&ust=1697973935893000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCICyqP6Dh4IDFQAAAAAdAAAAABAD";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Mohini Mehta"),
               accountEmail: Text("mohinimehta12@gmail.com"),
               currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageURL)),
               ),
               ),
               ListTile(
                leading: Icon(CupertinoIcons.home,color: Colors.white,
                ),
                title: Text("Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
                ),
               ),
               ListTile(
                leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,
                ),
                title: Text("Profile",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
                ),
               ),
               ListTile(
                leading: Icon(CupertinoIcons.mail,color: Colors.white,
                ),
                title: Text("Email me",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
                ),
               )
          ],
        ),
      ),
    );
  }
}
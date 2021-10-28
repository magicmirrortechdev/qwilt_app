import 'package:flutter/material.dart';

class SettingsMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.supervised_user_circle_outlined,
                  size: 60,
                ),
                Text(
                  'James Keck',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background_app.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle, color: Colors.blue),
            title: Text('Profile'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.password, color: Colors.blue),
            title: Text('Change password'),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.logout, color: Colors.blue),
              title: Text('Logout'),
              onTap: () {}),
        ],
      ),
    );
  }
}

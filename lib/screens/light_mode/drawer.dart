import 'package:flutter/material.dart';
import 'package:telegram_clone_flutter/screens/dark_mode/home_screen_dark.dart';

import '../dark_mode/drawer_dark.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  IconData _icon = Icons.brightness_2; // Changed var to IconData for better type inference

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Creative'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/img1.jpg'),
            ),
            accountEmail: Text(
              'creative1@gmail.com',
              style: TextStyle(color: Colors.white70),
            ),
            otherAccountsPictures: [
              IconButton(
                icon: Icon(
                  _icon,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  setState(() { // Added setState here
                    if (_icon == Icons.brightness_2) {
                      _icon = Icons.wb_sunny;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreenDark()));
                    } else {
                      _icon = Icons.brightness_2;
                      // Implement logic for switching back to light mode here
                    }
                  });
                },
              ),
            ],
          ),
          DrawerListTile(
            iconData: Icons.group,
            title: 'New Group',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.person_outline,
            title: 'Contacts',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.phone,
            title: 'Calls',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.place_outlined,
            title: 'People Nearby',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.bookmark_border,
            title: 'Saved Messages',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.settings,
            title: 'Settings',
            onTilePressed: () {},
          ),
          Divider(),
          DrawerListTile(
            iconData: Icons.person_add,
            title: 'Invite Friends',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.help_outline,
            title: 'Telegram FAQ',
            onTilePressed: () {},
          )
        ],
      ),
    );
  }
}

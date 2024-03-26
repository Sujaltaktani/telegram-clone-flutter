import 'package:flutter/material.dart';

import '../light_mode/home_screen.dart';

class DrawerScreenDark extends StatefulWidget {
  @override
  _DrawerScreenDarkState createState() => _DrawerScreenDarkState();
}

class _DrawerScreenDarkState extends State<DrawerScreenDark> {
  IconData _icon = Icons.wb_sunny;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Color(0xff212d3b)),
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
                  setState(() {
                    if (_icon == Icons.wb_sunny) {
                      _icon = Icons.brightness_2;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      _icon = Icons.wb_sunny;
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
          Divider(color: Colors.black),
          DrawerListTile(
            iconData: Icons.person_add,
            title: 'Invite Friends',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.group,
            title: 'Telegram F&Q',
            onTilePressed: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile({Key? key, required this.iconData, required this.title, required this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

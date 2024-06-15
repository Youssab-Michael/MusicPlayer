import 'package:flutter/material.dart';
import 'package:musicplayer/Screens/settings_Page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
              child: Icon(
            Icons.music_note,
            size: 40,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25),
            child: ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () => Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

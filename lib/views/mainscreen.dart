import 'package:flutter/material.dart';
import '/models/user.dart';

class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MY Tutor'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(widget.user.name.toString()),
                accountEmail: Text(widget.user.email.toString()),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://static.wikia.nocookie.net/line/images/b/bb/2015-brown.png/revision/latest?cb=20150808131630")),
                ),
              _createDrawerItem(
                icon: Icons.folder,
                text: 'My Subjects',
                onTap: () {},
              ),
              _createDrawerItem(
                icon: Icons.book,
                text: 'My Tutor Class',
                onTap: () {},
              ),
              _createDrawerItem(
                icon: Icons.settings,
                text: 'Settings',
                onTap: () {},
              ),
            ],
            ),
        ),
        body: Center(
          child: Container(
            child: Text('Hi! Welcome to MY Tutor!'),
          ),
        ),
    );
  }
  
  Widget _createDrawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row
    (children: <Widget>[
      Icon(icon),
      Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Text(text),
        )
    ],
    ),
    onTap: onTap,
  );

    }
}


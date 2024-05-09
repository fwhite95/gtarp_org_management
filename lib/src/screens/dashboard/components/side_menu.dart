import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Icon(Icons.start),
          ),
          DrawerListTile(
            title: 'Dashboard',
            icon: Icons.dashboard,
            press: () {},
          ),
          DrawerListTile(
            title: 'Weed',
            icon: Icons.payment,
            press: () {},
          ),
          DrawerListTile(
            title: 'Moonshine',
            icon: Icons.task,
            press: () {},
          ),
          DrawerListTile(
            title: 'Theft',
            icon: Icons.document_scanner,
            press: () {},
          ),
          DrawerListTile(
            title: 'Heist',
            icon: Icons.money,
            press: () {},
          ),
          DrawerListTile(
            title: 'Cleaning',
            icon: Icons.cleaning_services_outlined,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        size: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

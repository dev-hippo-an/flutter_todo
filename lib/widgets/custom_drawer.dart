import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_todo/locator.dart';
import 'package:todo_todo/repository/auth_repository.dart';
import 'package:todo_todo/widgets/drawer_menu.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Future<void> _logout() async {
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }

    await locator<AuthRepository>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        children: [
          const DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Flutter Todo',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DrawerMenu(
            onTab: () {},
            iconData: Icons.star,
            title: 'Stared tasks',
          ),
          // const DrawerCategoryTile(),
          DrawerMenu(
              onTab: () {},
              iconData: Icons.delete_outline,
              title: 'Manage Delete'),
          DrawerMenu(
            onTab: () {},
            iconData: Icons.settings,
            title: 'Settings',
          ),
          DrawerMenu(
            onTab: _logout,
            iconData: Icons.delete_outline,
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_todo/components/drawer/drawer_category_tile.dart';
import 'package:todo_todo/components/drawer/drawer_menu.dart';
import 'package:todo_todo/screens/stared_tasks_screen.dart';

class TodoCustomDrawer extends StatelessWidget {
  const TodoCustomDrawer({super.key});

  static const routeName = 'drawer';

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
                'Todo-Todo',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          DrawerMenu(
            onTab: () {
              context.pushNamed(StaredTaskScreen.routeName);
            },
            iconData: Icons.star,
            menuName: 'Stared tasks',
          ),
          const DrawerCategoryTile(),
          DrawerMenu(
              onTab: () {},
              iconData: Icons.delete_outline,
              menuName: 'Manage Delete'),
          DrawerMenu(
            onTab: () {},
            iconData: Icons.settings,
            menuName: 'Settings',
          ),
        ],
      ),
    );
  }
}

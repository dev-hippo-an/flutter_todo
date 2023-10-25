import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_todo/controller/category_controller.dart';
import 'package:todo_todo/screens/task_list_screen.dart';
import 'package:todo_todo/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_todo/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: _selectedIndex,
      child: SafeArea(
        child: Scaffold(
          drawer: const CustomDrawer(),
          bottomNavigationBar: CustomBottomNavigationBar(
            onTap: (value) {
              if (value != _selectedIndex) {
                setState(() {
                  _selectedIndex = value;
                });
              }
            },
          ),
          body: IndexedStack(
            index: _selectedIndex,
            children: [
              const TaskListScreen(),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Text('2'),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Text('3'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

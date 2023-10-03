import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_todo/components/task_list_screen/task_detail.dart';
import 'package:todo_todo/models/task_model.dart';
import 'package:todo_todo/provider/category_list_provider.dart';

class TaskDetailScreen extends StatelessWidget {
  static const routeName = 'task_detail';

  const TaskDetailScreen({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TaskDetail(
        task: task,
        category: Provider.of<CategoryListProvider>(context, listen: false).findCategory(task.categoryId),
      ),
    );
  }
}

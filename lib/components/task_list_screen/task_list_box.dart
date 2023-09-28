import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_todo/components/task_list_screen/task_list_section.dart';
import 'package:todo_todo/consts/enums.dart';
import 'package:todo_todo/provider/task_list_provider.dart';

class TaskListBox extends StatelessWidget {
  const TaskListBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Consumer<TaskListProvider>(
          builder: (BuildContext context, taskListProvider, Widget? child) {
            final now = DateTime.now();
            final filteredTask = taskListProvider.filteredTask;
            final pastTasks = filteredTask
                .where((task) => !task.isDone && task.isBeforeThanToday)
                .toList();
            final todayTasks = filteredTask.where((task) {
              return !task.isDone && isSameDay(task.dueDate, now);
            }).toList();
            final futureTasks = filteredTask
                .where((task) => !task.isDone && task.isFutureThanToday)
                .toList();
            final completeTodayTasks = filteredTask
                .where(
                    (task) => task.isDone && isSameDay(task.completedDate, now))
                .toList();

            return Column(
              children: [
                if (pastTasks.isNotEmpty)
                  TaskListSection(
                    tasks: pastTasks,
                    taskListSectionState: TaskListSectionState.past,
                  ),
                if (todayTasks.isNotEmpty)
                  TaskListSection(
                    tasks: todayTasks,
                    taskListSectionState: TaskListSectionState.today,
                  ),
                if (futureTasks.isNotEmpty)
                  TaskListSection(
                    tasks: futureTasks,
                    taskListSectionState: TaskListSectionState.future,
                  ),
                if (completeTodayTasks.isNotEmpty)
                  TaskListSection(
                    tasks: completeTodayTasks,
                    taskListSectionState: TaskListSectionState.complete,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

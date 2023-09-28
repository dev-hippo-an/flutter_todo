import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_todo/components/common/task_list_item.dart';
import 'package:todo_todo/provider/main_calendar_provider.dart';
import 'package:todo_todo/provider/task_list_provider.dart';

class CalendarTaskListBox extends StatelessWidget {
  const CalendarTaskListBox({super.key});

  @override
  Widget build(BuildContext context) {
    final taskListProvider = Provider.of<TaskListProvider>(context);
    final mainCalendarProvider = Provider.of<MainCalendarProvider>(context);

    final calendarList = taskListProvider.calendarList(mainCalendarProvider.selectedDate);
    return Expanded(
      child: ListView.builder(
        itemCount: calendarList.length,
        itemBuilder: (context, index) {
          return TaskListItem(
            task: calendarList[index],
          );
        },
      ),
    );
  }
}

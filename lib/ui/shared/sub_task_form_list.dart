import 'package:flutter/material.dart';
import 'package:todo_todo/core/models/sub_task_form_model.dart';
import 'package:todo_todo/ui/shared/sub_task_form.dart';

class SubTaskFormList extends StatelessWidget {
  const SubTaskFormList({
    super.key,
    required this.subTaskForms,
    required this.onRemove,
  });

  final List<SubTaskFormModel> subTaskForms;
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: subTaskForms.indexed.map(
        (e) {
          final subTaskFormModel = e.$2;
          return SubTaskForm(
            key: ValueKey<String>(subTaskFormModel.subTaskId),
            index: e.$1,
            subTaskFormModel: subTaskFormModel,
            onRemove: onRemove,
          );
        },
      ).toList(),
    );
  }
}
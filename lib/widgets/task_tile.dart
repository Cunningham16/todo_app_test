import 'package:flutter/material.dart';
import 'package:todo_app_test/models/task_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: taskModel.isCompleted,
        onChanged: (value) {},
      ),
      title: Text(taskModel.title),
    );
  }
}

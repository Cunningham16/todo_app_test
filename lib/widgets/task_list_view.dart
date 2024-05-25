import 'package:flutter/material.dart';
import 'package:todo_app_test/models/task_model.dart';
import 'package:todo_app_test/widgets/task_tile.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.taskList});

  final List<TaskModel> taskList;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) => TaskTile(
                taskModel: taskList[index],
              )),
    );
  }
}

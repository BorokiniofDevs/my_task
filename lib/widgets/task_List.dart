import 'package:flutter/material.dart';
import 'package:my_task/model/task.dart';

import 'package:my_task/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
    required this.onTaskCompleted,
  });

  final List<Task> tasks;
  final void Function(Task task) onTaskCompleted;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskItem(
        task: tasks[index],
        onTaskCompleted: onTaskCompleted,
      ),
    );
  }
}

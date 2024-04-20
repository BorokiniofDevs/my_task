import 'package:flutter/material.dart';
import 'package:my_task/model/task.dart';

import 'package:my_task/screen/component/task_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskItem(tasks[index]),
    );
  }
}

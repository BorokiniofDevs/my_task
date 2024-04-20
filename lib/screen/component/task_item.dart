import 'package:flutter/material.dart';
import 'package:my_task/model/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});

  final Task task;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              task.input,
              style: const TextStyle(color: Color.fromARGB(255, 47, 109, 50)),
            ),
            const Icon(Icons.time_to_leave_rounded)
          ],
        ),
      ),
    );
  }
}

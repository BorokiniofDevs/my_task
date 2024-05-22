import 'package:flutter/material.dart';
import 'package:my_task/model/task.dart';
import 'package:my_task/widgets/completed_drawer.dart';
import 'package:my_task/widgets/new_task.dart';
import 'package:my_task/widgets/task_List.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  // final void Function(Task task) onAdd;

  @override
  State<TaskScreen> createState() {
    return _TaskScreenState();
  }
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> _taskList = [
    Task(
      input: 'Study',
      category: Category.study,
    )
  ];

  // final List<Task> _activeTasks = [];
  final List<Task> _completedTasks = [];

  void addTask(Task task) {
    setState(() {
      _taskList.add(task);
    });
  }

  void completeTask(Task task) {
    setState(() {
      _taskList.remove(task);
      _completedTasks.add(task);
    });
  }

  @override
  Widget build(context) {
    Widget taskContent = const Center(
      child: Text(
        'No Task set yet!',
        style: TextStyle(color: Colors.green),
      ),
    );
    if (_taskList.isNotEmpty) {
      taskContent = TaskList(
        tasks: _taskList,
        onTaskCompleted: completeTask,
      );
      // const Text('Here are some tasks');
    }
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 44, 104, 46),
        title: const Text('Taskie'),
      ),
      drawer: CompletedTaskDrawer(
        completedTask: _completedTasks,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // NEW TASK
            NewTask(onAdd: addTask),
            const SizedBox(
              height: 20,
            ),
            // TASK LIST
            Expanded(
              child: taskContent,
            )
          ],
        ),
      ),
    );
  }
}

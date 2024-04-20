import 'package:flutter/material.dart';

import 'package:my_task/screen/start_screen.dart';

import 'package:my_task/screen/task_screen.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});
  @override
  State<Tasks> createState() {
    return _TaskState();
  }
}

class _TaskState extends State<Tasks> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'task-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'task-screen') {
      screenWidget = const TaskScreen();
    }
    // if (activeScreen == 'task-list') {
    //   screenWidget = TaskList(tasks: _taskList);
    // }
    return Container(child: screenWidget);
  }
}

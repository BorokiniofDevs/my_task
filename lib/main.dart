import 'package:flutter/material.dart';
import 'package:my_task/tasks.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 16, 70, 49),
              Color.fromARGB(255, 92, 173, 116)
            ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          ),
          child: const Tasks()),
    ),
  ));
}

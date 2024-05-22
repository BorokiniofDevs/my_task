import 'package:flutter/material.dart';
import 'package:my_task/model/task.dart';
// import 'package:flutter/widgets.dart';

class CompletedTaskDrawer extends StatelessWidget {
  const CompletedTaskDrawer({
    super.key,
    required this.completedTask,
  });

  final List<Task> completedTask;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 28, 78, 30)),
              child: Row(
                children: [
                  Text(
                    'Completed Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.done_all,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ListTile(
          //   // leading: Icon(
          //   //   Icons.work,
          //   //   color: Color.fromARGB(255, 51, 110, 53),
          //   // ),
          //   // title: Text('Dummy'),
          //   // onTap: ,

          // ),
          Expanded(
            child: ListView.builder(
              itemCount: completedTask.length,
              itemBuilder: (content, index) => ListTile(
                leading: const Icon(
                  Icons.work,
                  color: Color.fromARGB(255, 51, 110, 53),
                ),
                title: Text(completedTask[index].input),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

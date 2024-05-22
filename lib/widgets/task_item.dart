import 'package:flutter/material.dart';
import 'package:my_task/model/task.dart';
import 'package:my_task/widgets/countdown.dart';
import 'package:my_task/widgets/input_time.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final void Function(Task task) onTaskCompleted;

  const TaskItem({
    required this.task,
    required this.onTaskCompleted,
    super.key,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  DateTime? _deadline;

  void _timerModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => InputTime(
        onAddDuration: (duration) {
          setState(() {
            _deadline = DateTime.now().add(Duration(
              hours: duration.hours.toInt(),
              minutes: duration.minutes.toInt(),
              seconds: duration.seconds.toInt(),
            ));
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              widget.task.input,
              style: const TextStyle(
                color: Color.fromARGB(255, 47, 109, 50),
              ),
            ),
            const Spacer(),
            if (_deadline == null)
              IconButton(
                onPressed: _timerModal,
                icon: const Icon(Icons.timer),
              )
            else
              Countdown(
                deadline: _deadline!,
                // ADD TASK COMPLETED FEATURE
                onTimerFinished: () {
                  widget.onTaskCompleted(widget.task);
                  setState(() {
                    _deadline = null;
                  });
                },
              ),
          ],
        ),
      ),
    );
  }
}

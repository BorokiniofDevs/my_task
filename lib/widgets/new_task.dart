import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_task/model/task.dart';
import 'package:my_task/widgets/add_button.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAdd});

  final void Function(Task task) onAdd;

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _inputController = TextEditingController();
  Category selectedCategory = Category.work;
  Duration? timer;

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _submittask() {
    // VALIDATION
    if (_inputController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid task'),
                content: const Text('You can not set an empty task'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }
    // ALLOW USE OF ADD FUNC
    widget.onAdd(
      Task(
        input: _inputController.text,
        category: selectedCategory,
        // duration: timer!,
      ),
    );
    // Navigator.pop(context);
    _inputController.clear();
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: _inputController,
          style: GoogleFonts.lato(
            fontSize: 15,
            color: const Color.fromARGB(255, 19, 128, 104),
          ),
          decoration: const InputDecoration(
              focusColor: Colors.white,
              suffixIcon: Icon(
                Icons.work,
                color: Color.fromARGB(108, 5, 66, 7),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              hintStyle: TextStyle(color: Color.fromARGB(108, 5, 66, 7)),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(108, 5, 66, 7), width: 2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(173, 104, 129, 34), width: 2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(20))),
              hintText: 'Enter a new task'),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AddButton(
                action: _submittask,
                buttonText: 'Add task',
                color: const Color.fromARGB(255, 19, 128, 104)),
            const SizedBox(
              width: 10,
            ),
            DropdownButton(
              value: selectedCategory,
              items: Category.values
                  .map((category) => DropdownMenuItem(
                      value: category, child: Text(category.name)))
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  selectedCategory = value;
                });
              },
              borderRadius: BorderRadius.circular(10),
              dropdownColor: Colors.green,
            )
          ],
        ),
      ],
    );
  }
}

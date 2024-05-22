import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gif/gif.dart';
import 'package:my_task/model/duration.dart';
import 'package:my_task/model/task.dart';

class InputTime extends StatefulWidget {
  const InputTime({super.key, required this.onAddDuration});
  final void Function(TimeDuration duration) onAddDuration;

  @override
  State<InputTime> createState() => _InputTimeState();
}

class _InputTimeState extends State<InputTime> {
  final _hourController = TextEditingController();
  final _minutesController = TextEditingController();
  final _secondsController = TextEditingController();

  @override
  void dispose() {
    _hourController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  void _addDuration() {
    final hr = double.tryParse(_hourController.text) ?? 00;
    final min = double.tryParse(_minutesController.text) ?? 00;
    final sec = double.tryParse(_secondsController.text) ?? 00;

    if (hr == 00 && min == 00 && sec == 00) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('No Duration set'),
          content: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Set Now"),
          ),
        ),
      );
      return;
    }
    widget.onAddDuration(
      TimeDuration(
        hours: hr,
        minutes: min,
        seconds: sec,
      ),
    );
    // Navigator.pop(context);
    print(hr);
    print(min);
    print(sec);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          const Text(
            'Enter Duration',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 46, 107, 48),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _hourController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(2)],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('hours')
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _minutesController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(2)],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('minutes')
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _secondsController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(2)],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('seconds')
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 30,
          ),
          //  ADD SUMBIT BUTTON
          ElevatedButton(
            onPressed: _addDuration,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shadowColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: const Text('SET TIMER'),
          ),
          const SizedBox(
            height: 50,
          ),
          Gif(
            alignment: Alignment.center,
            autostart: Autostart.loop,
            image: const AssetImage(
              'assets/hourglass.gif',
            ),
          ),
        ],
      ),
    );
  }
}

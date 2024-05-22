import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({super.key});
  @override
  State<CountdownTimerPage> createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  Timer? _timer;
  int _remainingSeconds;

  _CountdownTimerPageState({int startSeconds = 10})
      : _remainingSeconds = startSeconds;

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingSeconds <= 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Countdown Timer')),
      body: Center(
        child: Text(
          '$_remainingSeconds',
          style: const TextStyle(fontSize: 48),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startCountdown,
        tooltip: 'Start Countdown',
        child: const Icon(Icons.timer),
      ),
    );
  }
}

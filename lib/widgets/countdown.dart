import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  const Countdown({
    super.key,
    required this.deadline,
    required this.onTimerFinished,
  });

  final DateTime deadline;
  final Function onTimerFinished;
  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late Timer timer;
  Duration duration = const Duration();

  void calculateTimeLeft(DateTime deadline) {
    final seconds = deadline.difference(DateTime.now()).inSeconds;
    // setState(() => duration = Duration(seconds: seconds));
    setState(
      () => duration = Duration(
        seconds: seconds > 0 ? seconds : 0,
      ),
    );

    //CALLBACK FUNC WHEN TIMER HITS 0
    if (duration.inSeconds == 0) {
      timer.cancel();
      widget.onTimerFinished();
    }
  }

  @override
  void initState() {
    //  super.initState();
    calculateTimeLeft(widget.deadline);

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        calculateTimeLeft(widget.deadline);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (duration.inSeconds <= 0) {
    //   return const Text('Elapsed');
    // }

    final hours = Text(
      duration.inHours.toString().padLeft(2, '0'),
    );
    final minutes = Text(
      duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
    );
    final seconds = Text(
      duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.green, Colors.black],
              ).createShader(
                Rect.fromLTWH(
                  0,
                  0,
                  bounds.width,
                  bounds.height,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: hours,
              ),
            ),
            const Text('hrs')
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.green, Colors.black],
              ).createShader(
                Rect.fromLTWH(
                  0,
                  0,
                  bounds.width,
                  bounds.height,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: minutes,
              ),
            ),
            const Text('mins')
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Colors.green, Colors.black],
              ).createShader(
                Rect.fromLTWH(
                  0,
                  0,
                  bounds.width,
                  bounds.height,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: seconds,
              ),
            ),
            const Text('sec')
          ],
        ),
      ],
    );
  }
}

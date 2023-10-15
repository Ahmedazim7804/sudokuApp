import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  DateTime timeElapsed = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timers) {
      setState(() {
        timeElapsed = timeElapsed.add(const Duration(seconds: 1));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Elapsed Time : ${timeElapsed.toString().substring(10, 19)}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}

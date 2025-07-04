import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'dart:async';

import 'package:portox_app/app/commons/styles/tokens.dart';

class ChecklistTimerCounter extends StatefulWidget {
  final int estimatedTime; // Tempo estimado em segundos
  final Function(int) onTimeElapsed; // Callback para informar o tempo decorrido

  const ChecklistTimerCounter({
    Key? key,
    required this.estimatedTime,
    required this.onTimeElapsed,
  }) : super(key: key);

  @override
  _ChecklistTimerCounterState createState() => _ChecklistTimerCounterState();
}

class _ChecklistTimerCounterState extends State<ChecklistTimerCounter> {
  late Timer _timer;
  int _elapsedTime = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
      });
      widget.onTimeElapsed(_elapsedTime);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                intl(context, 'checklist.timer-estimated'),
                style: TextStyle(
                  fontWeight: Ox.fontWeights.semibold,
                  fontSize: Ox.fontSizes.ref40,
                  color: Ox.colors.blue,
                ),
              ),
              Text(
                _formatTime(widget.estimatedTime),
                style: TextStyle(
                  fontWeight: Ox.fontWeights.semibold,
                  fontSize: Ox.fontSizes.ref40,
                  color: Ox.colors.blue,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                intl(context, 'checklist.timer-elapsed'),
                style: TextStyle(
                  fontWeight: Ox.fontWeights.semibold,
                  fontSize: Ox.fontSizes.ref40,
                  color: Ox.colors.blue,
                ),
              ),
              Text(
                _formatTime(_elapsedTime),
                style: TextStyle(
                  fontWeight: Ox.fontWeights.semibold,
                  fontSize: Ox.fontSizes.ref40,
                  color: Ox.colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

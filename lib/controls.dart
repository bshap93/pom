import 'dart:async';

import 'package:flutter/material.dart';

enum TimerControl { back, pause, forward }

class TimerControlKeys extends StatefulWidget {
  final ValueChanged<TimerControl>? onTimerControlChanged;

  const TimerControlKeys({Key? key, required this.onTimerControlChanged})
      : super(key: key);

  @override
  State<TimerControlKeys> createState() => _TimerControlKeysState();
}

class _TimerControlKeysState extends State<TimerControlKeys> {
  bool _isTimerPaused = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 120,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ControlKey(
                  icons: Icons.keyboard_arrow_left,
                  onTapBack: (det) {
                    updateTimer(TimerControl.back);
                  },
                  onTapPause: (dets) {
                    updateTimer(TimerControl.pause);
                  },
                  onTapForward: () {
                    updateTimer(TimerControl.forward);
                  },
                ),
              ),
              Expanded(
                child: ControlKey(
                  icons: Icons.pause,
                  onTapBack: (det) {
                    updateTimer(TimerControl.back);
                  },
                  onTapPause: (dets) {
                    updateTimer(TimerControl.pause);
                  },
                  onTapForward: () {
                    updateTimer(TimerControl.forward);
                  },
                ),
              ),
              Expanded(
                child: ControlKey(
                  icons: Icons.keyboard_arrow_right,
                  onTapBack: (det) {
                    updateTimer(TimerControl.back);
                  },
                  onTapPause: (dets) {
                    updateTimer(TimerControl.pause);
                  },
                  onTapForward: () {
                    updateTimer(TimerControl.forward);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateTimer(TimerControl newControlPush) {
    switch (newControlPush) {
      case TimerControl.back:
        _restartTimer();
        break;
      case TimerControl.pause:
        _pauseTimer();
        break;
      case TimerControl.forward:
        _skipTimer();
        break;
    }
  }

  void _restartTimer() {}

  void _pauseTimer() {}

  void _skipTimer() {}
}

class ControlKey extends StatelessWidget {
  const ControlKey({
    Key? key,
    required this.icons,
    required this.onTapBack,
    required this.onTapPause,
    required this.onTapForward,
  }) : super(key: key);
  final IconData icons;
  final Function(TapDownDetails) onTapBack;
  final Function(TapUpDetails) onTapPause;
  final Function() onTapForward;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapBack,
      onTapUp: onTapPause,
      onLongPress: onTapForward,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0x88ffffff),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icons,
          size: 42,
        ),
      ),
    );
  }
}

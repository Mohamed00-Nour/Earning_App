import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountdownButton extends StatefulWidget {
  final VoidCallback onPressedFunction;
  final String buttonText;
  final String buttonKey;

  CountdownButton({required this.onPressedFunction, required this.buttonText, required this.buttonKey});

  @override
  _CountdownButtonState createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  Timer? _timer;
  int _start = 0;


  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() async {
    final prefs = await SharedPreferences.getInstance();
    final lastClickTime = prefs.getInt('lastClickTime_${widget.buttonKey}') ?? 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    final difference = now - lastClickTime;
    if (difference < 24 * 60 * 60 * 1000) {
      setState(() {
        _start = 24 * 60 * 60 - (difference ~/ 1000);
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (_start < 1) {
          timer.cancel();
        } else {
          setState(() {
            _start--;
          });
        }
      });
    }
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff138745),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed:
          _start > 0 ? null : widget.onPressedFunction as void Function()?,
      child: _start > 0
          ? Text(
              '${_start ~/ 3600}:${(_start % 3600) ~/ 60}:${_start % 60}',
              style: const TextStyle(color: Colors.white,
              fontSize: 14,
              ),
            )
          : Text(widget.buttonText),
    );
  }
}

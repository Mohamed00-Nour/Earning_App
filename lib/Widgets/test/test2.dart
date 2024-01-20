import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
  static const id = 'Test2';
}

class _Test2State extends State<Test2> {
  Timer? _timer;
  Duration remainingTime = const Duration(hours: 24);
  bool isButtonClicked = false;
  final String hiveKey = 'lastClickTimeButton2'; // Define the key here

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (remainingTime == Duration.zero) {
          timer.cancel();
          setState(() {
            isButtonClicked = false;
          });
        } else {
          setState(() {
            remainingTime -= oneSec;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: isButtonClicked ? (){} : () async {
            var box = await Hive.openBox('myBox');
            DateTime? lastClickTime = box.get(hiveKey) != null
                ? DateTime.parse(box.get(hiveKey))
                : null;

            if (lastClickTime != null &&
                DateTime.now().difference(lastClickTime).inHours < 24) {
              remainingTime = const Duration(hours: 24) - DateTime.now().difference(lastClickTime!);
              startTimer();
              setState(() {
                isButtonClicked = true;
              });
            } else {
              box.put(hiveKey, DateTime.now().toIso8601String());
              // Your button click logic here
            }
          },
          child: Text(isButtonClicked ? "Wait  ${remainingTime.inHours.toString().padLeft(2, '0')} : ${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')} : ${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}" : 'Claim'),
        ),
      ),
    );
  }
}
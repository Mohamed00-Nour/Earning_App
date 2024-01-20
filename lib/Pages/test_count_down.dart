import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TestCountDown extends StatefulWidget {
  @override
  _TestCountDownState createState() => _TestCountDownState();
}

class _TestCountDownState extends State<TestCountDown> {
  Timer? _timer;
  Duration remainingTime = const Duration(hours: 24);
  bool isButtonClicked = false;
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
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: isButtonClicked ? (){} : () async {
              var box = await Hive.openBox('myBox');
              DateTime? lastClickTime = box.get('lastClickTime') != null
                  ? DateTime.parse(box.get('lastClickTime'))
                  : null;

              if (lastClickTime != null &&
                  DateTime.now().difference(lastClickTime).inHours < 24) {
                remainingTime = const Duration(hours: 24) - DateTime.now().difference(lastClickTime!);
                startTimer();
                setState(() {
                  isButtonClicked = true;
                });
              } else {
                box.put('lastClickTime', DateTime.now().toIso8601String());
                // Your button click logic here
              }
            },
            child: Text(isButtonClicked ? "Wait  ${remainingTime.inHours.toString().padLeft(2, '0')} : ${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')} : ${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}" : 'Claim'),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, 'Test1');
          }, child: Text('Test1'),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, 'Test2');
          }, child: Text('Test2'),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, 'Test3');
          }, child: Text('Test3'),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, 'Test4');
          }, child: Text('Test4'),
          ),

        ],
      ),
    );
  }
}
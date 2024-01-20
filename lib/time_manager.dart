import 'dart:async';

import 'package:hive/hive.dart';

class TimerManager {
  final Function(Duration) onTimeChanged;
  final Function(bool) onButtonStateChanged;
  TimerManager({required this.onTimeChanged, required this.onButtonStateChanged});

  Timer? _timer;
  Duration remainingTime = Duration.zero;
  bool isButtonClicked = false;
  final String hiveKey = 'lastClickTimeButton'; // Define the key here


  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      var box = await Hive.openBox('myBox');
      DateTime? lastClickTime = box.get(hiveKey) != null
          ? DateTime.parse(box.get(hiveKey))
          : null;

      if (lastClickTime != null &&
          DateTime.now().difference(lastClickTime).inSeconds < 10) {
        remainingTime = const Duration(seconds: 100) - DateTime.now().difference(lastClickTime!);
        onTimeChanged(remainingTime);
      } else {
        _timer?.cancel();
        isButtonClicked = false;
        onButtonStateChanged(isButtonClicked);
      }
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
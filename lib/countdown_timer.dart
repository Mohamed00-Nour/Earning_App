import 'dart:async';
import 'package:hive/hive.dart';

class CountdownTimer {
  static const countdownBox = 'countdownBox';
  static const countdownKey = 'countdownKey';
  late Timer _timer;

  Future<void> startCountdown() async {
    var box = await Hive.openBox(countdownBox);
    DateTime startTime = DateTime.now();
    box.put(countdownKey, startTime.toIso8601String());

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateCountdown();
    });
  }

  Future<Duration> getRemainingTime() async {
    var box = await Hive.openBox(countdownBox);
    String? startTimeString = box.get(countdownKey);
    if (startTimeString != null) {
      DateTime startTime = DateTime.parse(startTimeString);
      DateTime currentTime = DateTime.now();
      Duration timePassed = currentTime.difference(startTime);
      Duration remainingTime = Duration(hours: 24) - timePassed;
      return remainingTime;
    } else {
      return Duration(hours: 24);
    }
  }

  Future<String> updateCountdown() async {
    Duration remainingTime = await getRemainingTime();
    String formattedTime = formatDuration(remainingTime);
    if (remainingTime.inSeconds <= 0) {
      _timer.cancel();
    }
    return formattedTime;
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
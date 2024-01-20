import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'countdown_state.dart';

class Count extends Cubit<CountdownState> {
  static const countdownBox = 'countdownBox';
  static const countdownKey = 'countdownKey';
  late Timer _timer;
  Count() : super(CountdownInitial());

  Future<void> startCountdown() async {
    var box = await Hive.openBox(countdownBox);
    String? startTimeString = box.get(countdownKey);
    if (startTimeString == null) {
      DateTime startTime = DateTime.now();
      box.put(countdownKey, startTime.toIso8601String());
    }
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

  Future<void> updateCountdown() async {
    Duration remainingTime = await getRemainingTime();
    String formattedTime = formatDuration(remainingTime);
    if (remainingTime.inSeconds <= 0) {
      _timer.cancel();
      emit(CountdownFinished());
    } else {
      emit(CountdownRunning(formattedTime));
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }









}

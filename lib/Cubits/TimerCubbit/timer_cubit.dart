import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;
  final String hiveKey = 'lastClickTimeButton';
  TimerCubit() : super(TimerInitial());

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      var box = await Hive.openBox('myBox');
      DateTime? lastClickTime = box.get(hiveKey) != null
          ? DateTime.parse(box.get(hiveKey))
          : null;

      if (lastClickTime != null &&
          DateTime.now().difference(lastClickTime).inSeconds < 10) {
        emit(TimerRunning(remainingTime: const Duration(seconds: 10) - DateTime.now().difference(lastClickTime!)));
      } else {
        _timer?.cancel();
        emit(TimerFinished());
      }
    });
  }
  void dispose() {
    _timer?.cancel();
  }

}

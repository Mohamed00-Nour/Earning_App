import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
part 'count_down_state.dart';

class CountDownCubit extends Cubit<CountDownState> {
  CountDownCubit() : super(CountdownInitial('default'));

  Timer? _timer;

  Future<void> startCountdown(String buttonKey) async {
    try {
      final box = await Hive.openBox('countdownBox');
      final now = DateTime.now().millisecondsSinceEpoch;
      final endTime = now + 24 * 60 * 60 * 1000; // 24 hours from now
      await box.put('endTime_$buttonKey', endTime);
      print('Countdown started, end time: $endTime');
      _startTimer(endTime);
    } catch (e) {
      // Handle errors
      print('Error starting countdown: $e');
      emit(CountdownError('Error starting countdown'));
    }
  }

  void _startTimer(int endTime) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final remainingTime = endTime - now;
      print('Remaining time: $remainingTime');
      if (remainingTime <= 0) {
        _timer?.cancel();
        print('Countdown completed');
        emit(CountdownCompleted('default'));
      } else {
        emit(CountdownInProgress('default', remainingTime));
      }
    });
  }

  Future<void> loadRemainingTime(String buttonKey) async {
    try {
      final box = await Hive.openBox('countdownBox');
      final endTime = box.get('endTime_$buttonKey');
      if (endTime != null) {
        final now = DateTime.now().millisecondsSinceEpoch;
        final remainingTime = endTime - now;
        print('Loaded remaining time: $remainingTime');
        if (remainingTime > 0) {
          _startTimer(endTime);
        } else {
          print('Countdown completed');
          emit(CountdownCompleted('default'));
        }
      }
    } catch (e) {
      // Handle errors
      print('Error loading remaining time: $e');
      emit(CountdownError('Error loading remaining time'));
    }
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    print('Countdown cubit closed');
    await Hive.close();
    return super.close();
  }
}
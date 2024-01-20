part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {}
class TimerRunning extends TimerState {
  final Duration remainingTime;
  TimerRunning({required this.remainingTime});
}
class TimerFinished extends TimerState {}

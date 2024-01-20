part of 'countdown_cubit.dart';

@immutable
abstract class CountdownState {}

class CountdownInitial extends CountdownState {}
class CountdownRunning extends CountdownState {
  final String time;
  CountdownRunning(this.time);
}
class CountdownFinished extends CountdownState {}
class CountdownError extends CountdownState {
  final String message;
  CountdownError(this.message);
}

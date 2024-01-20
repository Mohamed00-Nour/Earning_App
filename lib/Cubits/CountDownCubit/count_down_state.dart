part of 'count_down_cubit.dart';


abstract class CountDownState {
}

class CountdownInitial extends CountDownState {
  final String buttonKey;
  CountdownInitial(this.buttonKey);
}

class CountdownInProgress extends CountDownState {
  final int remainingTime;
  final String buttonKey;

  CountdownInProgress(this.buttonKey, this.remainingTime);
}

class CountdownCompleted extends CountDownState {
  final String buttonKey;
  CountdownCompleted(this.buttonKey);
}
class CountdownError extends CountDownState {
  final String message;
  CountdownError(this.message);
}

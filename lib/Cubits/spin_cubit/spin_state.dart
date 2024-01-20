part of 'spin_cubit.dart';

@immutable
abstract class SpinState {}

class SpinInitial extends SpinState {}
class SpinInProgress extends SpinState {}
class SpinSuccess extends SpinState {
  final int reward;
  SpinSuccess(this.reward);
}
class SpinLimitReached extends SpinState {}
class SpinLimitReachedWithTime extends SpinState {
  final Duration remainingTime;
  SpinLimitReachedWithTime(this.remainingTime);
}
class SpinDisableButton extends SpinState {}
class SpinStartCounter extends SpinState {}
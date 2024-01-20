part of 'scratch_cubit.dart';

@immutable
abstract class ScratchState {}

class ScratchInitial extends ScratchState {}
class ScratchLoading extends ScratchState {
  final int randomNumber;
  ScratchLoading(this.randomNumber);
}
class ScratchSuccess extends ScratchState {
  final int randomNumber;
  ScratchSuccess(this.randomNumber);
}
class ScratchFailed extends ScratchState {
  final String errorMessage;
  ScratchFailed(this.errorMessage);
}


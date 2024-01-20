part of 'task_completion_cubit.dart';

@immutable
abstract class TaskCompletionState {}

class TaskCompletionInitial extends TaskCompletionState {}
class TaskCompletionInProgress extends TaskCompletionState {}
class TaskCompletionSuccess extends TaskCompletionState {}
class TaskCompletionFailure extends TaskCompletionState {
  final String errMessage;
  TaskCompletionFailure(this.errMessage);
}
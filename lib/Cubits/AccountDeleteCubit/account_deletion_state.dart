part of 'account_deletion_cubit.dart';

@immutable
abstract class AccountDeletionState {}

class AccountDeletionInitial extends AccountDeletionState {}

class AccountDeletionLoading extends AccountDeletionState {}

class AccountDeletionSuccess extends AccountDeletionState {}

class AccountDeletionFailed extends AccountDeletionState {
  final String error;

  AccountDeletionFailed(this.error);
}
class AccountDeletionValidationFailed extends AccountDeletionState {
  final String error;

  AccountDeletionValidationFailed(this.error);
}
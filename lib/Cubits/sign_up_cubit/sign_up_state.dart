// File: lib/cubits/sign_up_cubit/sign_up_state.dart

part of 'sign_up_cubit.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}
class SignUpSuccess extends SignUpState {}
class SignUpFailed extends SignUpState {
  final String errMessage;
  SignUpFailed({required this.errMessage});
}
class SignUpEmailAlreadyInUse extends SignUpState {}
class SignUpInvalidEmail extends SignUpState {}
class SignUpOperationNotAllowed extends SignUpState {}
class SignUpWeakPassword extends SignUpState {}
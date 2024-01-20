part of 'forget_password_cubit.dart';


abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgotPasswordLoading extends ForgetPasswordState {}
class ForgotPasswordSuccess extends ForgetPasswordState {}
class ForgotPasswordFailed extends ForgetPasswordState {
  final String errMessage;
  ForgotPasswordFailed({required this.errMessage});
}
class ForgotPasswordUserNotFound extends ForgetPasswordState {}
class ForgotPasswordInvalidEmail extends ForgetPasswordState {}


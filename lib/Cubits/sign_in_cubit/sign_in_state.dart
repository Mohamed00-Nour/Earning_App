part of 'sign_in_cubit.dart';


abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInInvalidEmail extends SignInState {}

class SignInUserDisabled extends SignInState {}

class SignInUserNotFound extends SignInState {}

class SignInWrongPassword extends SignInState {}

class SignInFailed extends SignInState {
  final String errMessage;

  SignInFailed({required this.errMessage});
}

class SignInLoggedOut extends SignInState {}

class SignInLoggedIn extends SignInState {}
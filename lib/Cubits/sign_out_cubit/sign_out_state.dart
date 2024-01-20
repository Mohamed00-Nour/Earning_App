// File: lib/cubits/sign_out_cubit/sign_out_state.dart

part of 'sign_out_cubit.dart';

abstract class SignOutState {}

class SignOutInitial extends SignOutState {}
class SignOutLoading extends SignOutState {}
class SignOutSuccess extends SignOutState {}
class SignOutFailed extends SignOutState {
  final String errMessage;
  SignOutFailed({required this.errMessage});
}
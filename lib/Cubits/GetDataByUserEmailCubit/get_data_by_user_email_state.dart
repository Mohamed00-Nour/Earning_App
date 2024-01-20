part of 'get_data_by_user_email_cubit.dart';

@immutable
abstract class GetDataByUserEmailState {}

class GetDataByUserEmailInitial extends GetDataByUserEmailState {}
class GetDataByUserEmailLoading extends GetDataByUserEmailState {}
class GetDataByUserEmailLoaded extends GetDataByUserEmailState {
  final Map<String, dynamic> userData;
  GetDataByUserEmailLoaded(this.userData);
}
class GetDataByUserEmailFailure extends GetDataByUserEmailState {
  final String errMessage;
  GetDataByUserEmailFailure(this.errMessage);
}

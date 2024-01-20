import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  Future<void> forgotPassword({required String email}) async {
    try {
      emit(ForgotPasswordLoading());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgotPasswordSuccess());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ForgotPasswordUserNotFound());
      } else if (e.code == 'invalid-email') {
        emit(ForgotPasswordInvalidEmail());
      }
    } catch (e) {
      emit(ForgotPasswordFailed(errMessage: e.toString()));
    }
  }
}

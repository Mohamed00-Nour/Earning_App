import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'account_deletion_state.dart';

class AccountDeletionCubit extends Cubit<AccountDeletionState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AccountDeletionCubit() : super(AccountDeletionInitial());

  void validateAndDeleteAccount(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      emit(AccountDeletionValidationFailed('Email and password must not be empty.'));
    } else {
      deleteAccount(email, password);
    }
  }

  Future<void> deleteAccount(String email, String password) async {
    emit(AccountDeletionLoading());

    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
      await _auth.currentUser!.delete();
      emit(AccountDeletionSuccess());
    } catch (e) {
      emit(AccountDeletionFailed(e.toString()));
    }
  }

}

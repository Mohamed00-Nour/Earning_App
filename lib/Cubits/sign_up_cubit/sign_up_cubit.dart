
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUp({required String name, required String email, required String password}) async {
    try {
      emit(SignUpLoading());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
       await addUserDetails(name: name, email: email, password: password);
      emit(SignUpSuccess());

    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(SignUpEmailAlreadyInUse());
      } else if (e.code == 'invalid-email') {
        emit(SignUpInvalidEmail());
      } else if (e.code == 'operation-not-allowed') {
        emit(SignUpOperationNotAllowed());
      } else if (e.code == 'weak-password') {
        emit(SignUpWeakPassword());
      }
    } catch (e) {
      emit(SignUpFailed(errMessage: e.toString()));
    }
  }

  Future<void> addUserDetails({required String name, required String email, required String password}) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
      'password': password,
      'Revenue': 0,
    });
  }
}


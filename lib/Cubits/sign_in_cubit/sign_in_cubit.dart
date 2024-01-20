import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late StreamSubscription<User?> _authStateSubscription;

  SignInCubit() : super(SignInInitial()) {
    _authStateSubscription = _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        emit(SignInLoggedOut());
      } else {
        emit(SignInLoggedIn());
      }
    });
  }

  Future<void> signIn({required String email,required String password}) async {
    try {
      emit(SignInLoading());
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(SignInSuccess());
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-email') {
        emit(SignInInvalidEmail());
      } else if (e.code == 'user-disabled') {
        emit(SignInUserDisabled());
      } else if (e.code == 'user-not-found') {
        emit(SignInUserNotFound());
      } else if (e.code == 'wrong-password') {
        emit(SignInWrongPassword());
      }
      rethrow;
    } catch (e) {
      emit(SignInFailed(errMessage: e.toString()));
      rethrow;
    }
  }  @override
  Future<void> close() {
    _authStateSubscription.cancel();
    return super.close();
  }
}
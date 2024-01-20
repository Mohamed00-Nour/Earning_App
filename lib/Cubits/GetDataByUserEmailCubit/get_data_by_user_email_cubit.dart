import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_data_by_user_email_state.dart';

class GetDataByUserEmailCubit extends Cubit<GetDataByUserEmailState> {
  final _userDataController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get userDataStream => _userDataController.stream;
  GetDataByUserEmailCubit() : super(GetDataByUserEmailInitial());

  void getUserDataByEmail(String email) {
    emit(GetDataByUserEmailLoading());
    try {
      FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
          Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;
          _userDataController.add(userData);
          emit(GetDataByUserEmailLoaded(userData));
        } else {
          emit(GetDataByUserEmailFailure('No user found for given email'));
        }
      });
    } catch (e) {
      emit(GetDataByUserEmailFailure(e.toString()));
    }
  }
  @override
  Future<void> close() {
    _userDataController.close();
    return super.close();
  }

}

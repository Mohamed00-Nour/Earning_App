import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'task_completion_state.dart';

class TaskCompletionCubit extends Cubit<TaskCompletionState> {
  TaskCompletionCubit() : super(TaskCompletionInitial());

  void completeTask(String email, int reward) async {
    emit(TaskCompletionInProgress());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        int currentRevenue = data['Revenue'] ?? 0;
        int updatedRevenue = currentRevenue + reward;
        await documentSnapshot.reference.update({'Revenue': updatedRevenue});
        emit(TaskCompletionSuccess());
      } else {
        emit(TaskCompletionFailure('No user found for given email'));
      }
    } catch (e) {
      emit(TaskCompletionFailure(e.toString()));
    }
  }
}

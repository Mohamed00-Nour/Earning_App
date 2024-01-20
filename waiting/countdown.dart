// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'count_down_state.dart';
//
// class CountDownCubit extends Cubit<CountDownState> {
//   CountDownCubit() : super(CountdownInitial('default'));
//   final Map<String, Timer> timers = {};
//   void startCountdown(String buttonKey) {
//     timers[buttonKey]?.cancel(); // Cancel any existing timer for this buttonKey
//     var remainingTime = const Duration(seconds: 60);
//     emit(CountdownInitial(buttonKey)); // Emit CountdownInitial at the beginning
//     timers[buttonKey] = Timer.periodic(const Duration(seconds: 1), (timer) {
//       remainingTime = remainingTime - const Duration(seconds: 1);
//       emit(CountdownInProgress(buttonKey, remainingTime));
//       if (remainingTime.inSeconds <= 0) {
//         timer.cancel();
//         emit(CountdownCompleted(buttonKey));
//         remainingTime = Duration.zero; // Reset the remainingTime to zero
//         emit(CountdownInitial(buttonKey)); // Emit CountdownInitial after countdown is over
//       }
//     });
//   }
//
//   @override
//   Future<void> close() {
//     timers.values.forEach((timer) => timer.cancel());
//     return super.close();
//   }
//
// }

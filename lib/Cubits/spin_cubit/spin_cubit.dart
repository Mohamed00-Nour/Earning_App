import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'spin_state.dart';

class SpinCubit extends Cubit<SpinState> {
  SpinCubit() : super(SpinInitial());
  final List<int> items = [1, 2, 0, 10, 5, 0];
  int counter = 3;
  final selected = BehaviorSubject<int>();
  int reward = 0;
  Timer? timer;


  void startSpin() {
    if (counter > 0 ){
      emit(SpinInitial());
      selected.add(Fortune.randomInt(0, items.length));
      emit(SpinInProgress());
    }else {
      if (!(state is SpinLimitReached)) {
        counter--;
        startCountdown();
        emit(SpinLimitReached());
      }
    }
  }

  void spinEnded() {
    if (counter > 1) {
      emit(SpinInitial());
      reward = items[selected.value];
      emit(SpinSuccess(reward));
      counter--;
    } else if (counter == 1  ) {
      if (!(state is SpinLimitReached)) {
        counter--;
        startCountdown();
        emit(SpinLimitReached());
      }
    }
  }

  void startCountdown() {
    var remainingTime = const Duration(seconds: 50);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime = remainingTime - const Duration(seconds: 1);
      emit(SpinLimitReachedWithTime(remainingTime));
      if (remainingTime.inSeconds <= 0) {
        timer.cancel();
        counter = 3;
        emit(SpinInitial());
      }
    });
  }



  void dispose() {
    selected.close();
    timer?.cancel();
    super.close();
  }

}


// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'scratch_state.dart';
//
// class ScratchCubit extends Cubit<ScratchState> {
//   ScratchCubit() : super(ScratchInitial());
//   int counter = 3;
//   int reward = 0;
//   Timer? timer;
//
//   void startScratch() {
//     if (counter > 0 ){
//       emit(ScratchInProgress());
//       counter--;
//     } else {
//       if (!(state is ScratchLimitReached)) {
//         startCountdown();
//         emit(ScratchLimitReached());
//       }
//     }
//   }
//
//   void scratchEnded() {
//     if (counter > 0) {
//       reward = /* calculate reward here */;
//       emit(ScratchSuccess(reward));
//     } else if (!(state is ScratchLimitReached)) {
//       startCountdown();
//       emit(ScratchLimitReached());
//     }
//   }
//
//   void startCountdown() {
//     var remainingTime = const Duration(seconds: 50);
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       remainingTime = remainingTime - const Duration(seconds: 1);
//       emit(ScratchLimitReachedWithTime(remainingTime));
//       if (remainingTime.inSeconds <= 0) {
//         timer.cancel();
//         counter = 3;
//         emit(ScratchInitial());
//       }
//     });
//   }
//
//   @override
//   Future<void> close() {
//     timer?.cancel();
//     return super.close();
//   }
// }
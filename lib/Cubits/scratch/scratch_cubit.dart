import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scratcher/widgets.dart';

part 'scratch_state.dart';

class ScratchCubit extends Cubit<ScratchState> {
  ScratchCubit() : super(ScratchInitial());
  bool _enabled = true;
  List<int> numbers = [1, 2, 3, 5, 6, 10];
  int? randomNumber;
  final scratchKey = GlobalKey<ScratcherState>();
  int counter = 10;
  bool hasReachedThreshold = false;
  int remainingTimeInSeconds = 0;
  Timer? countdownTimer;

  void startCountdownTimer() {

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {

        if (remainingTimeInSeconds > 0) {
          remainingTimeInSeconds--;
        } else {
          countdownTimer!.cancel();
          counter = 10; // Reset counter to 10 after 24 hours
        }
      });

  }

}

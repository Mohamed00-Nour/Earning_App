import 'package:flutter/material.dart';
import 'package:flutter_auth/Cubits/TaskCompletionCubit/task_completion_cubit.dart';
import 'package:hive/hive.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Utils {
  static Future<void> handleButtonPress(BuildContext context, String hiveKey, int coins, TaskCompletionCubit taskCompletionCubit, String email) async {
    var box = await Hive.openBox('myBox');
    DateTime? lastClickTime = box.get(hiveKey) != null
        ? DateTime.parse(box.get(hiveKey))
        : null;
    if (lastClickTime != null &&
        DateTime.now().difference(lastClickTime).inSeconds < 20) {
      Duration remainingTime = const Duration(seconds: 20) - DateTime.now().difference(lastClickTime!);
      String remainingTimeString = "${remainingTime.inHours} hours ${remainingTime.inMinutes.remainder(60)} minutes ${remainingTime.inSeconds.remainder(60)} seconds";
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.bottomSlide,
        title: 'Info',
        desc: 'Please wait for $remainingTimeString',
        btnOkOnPress: () {},
      ).show();
    } else {
      box.put(hiveKey, DateTime.now().toIso8601String());
      taskCompletionCubit.completeTask(email, coins);
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Congratulations',
        desc: 'You have earned $coins coins',
        btnOkOnPress: () {},
      ).show();
    }
  }
}
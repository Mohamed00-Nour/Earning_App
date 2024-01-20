// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
//
// import '../../time_manager.dart'; // Import TimerManager
//
// class Test4 extends StatefulWidget {
//   @override
//   _Test4State createState() => _Test4State();
//   static const id = 'Test4';
// }
//
// class _Test4State extends State<Test4> {
//   final String hiveKey = 'lastClickTimeButton4'; // Define the key here
//   final TimerManager timerManager = TimerManager(); // Create an instance of TimerManager
//
//   @override
//   void dispose() {
//     timerManager.dispose(); // Use the dispose method of TimerManager
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             if (!timerManager.isButtonClicked) { // Use the isButtonClicked property of TimerManager
//               var box = await Hive.openBox('myBox');
//               DateTime? lastClickTime = box.get(hiveKey) != null
//                   ? DateTime.parse(box.get(hiveKey))
//                   : null;
//
//               if (lastClickTime != null &&
//                   DateTime.now().difference(lastClickTime).inSeconds < 10) {
//                 timerManager.remainingTime = const Duration(seconds: 10) - DateTime.now().difference(lastClickTime!); // Use the remainingTime property of TimerManager
//                 timerManager.startTimer(); // Use the startTimer method of TimerManager
//                 setState(() {
//                   timerManager.isButtonClicked = true; // Use the isButtonClicked property of TimerManager
//                 });
//               } else {
//                 box.put(hiveKey, DateTime.now().toIso8601String());
//                 timerManager.remainingTime = const Duration(seconds: 10); // Use the remainingTime property of TimerManager
//                 timerManager.startTimer(); // Use the startTimer method of TimerManager
//                 setState(() {
//                   timerManager.isButtonClicked = true; // Use the isButtonClicked property of TimerManager
//                 });
//               }
//             }
//           },
//           child: Text(timerManager.isButtonClicked ? "Wait  ${timerManager.remainingTime.inSeconds.toString().padLeft(2, '0')}" : 'Claim'), // Use the remainingTime and isButtonClicked properties of TimerManager
//         ),
//       ),
//     );
//   }
// }
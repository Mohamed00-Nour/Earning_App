//00
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Cubits/count/countdown_cubit.dart';
// import 'package:flutter_auth/Pages/Login_Page.dart';
// import 'package:flutter_auth/Pages/Sign_Up_Page.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
//
// import 'Gnav.dart';
//
//
// class TestCountDown extends StatelessWidget {
//   const TestCountDown({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => Count(),
//       child: TestCountDownView(),
//     );
//   }
// }
//
// // class TestCountDownView extends StatefulWidget {
// //   @override
// //   _TestCountDownViewState createState() => _TestCountDownViewState();
// // }
// //
// // class _TestCountDownViewState extends State<TestCountDownView> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           const SizedBox(
// //             height: 100,
// //           ),
// //           ElevatedButton(
//             onPressed: () async {
//               var box = await Hive.openBox('myBox');
//               DateTime? lastClickTime = box.get('lastClickTime') != null
//                   ? DateTime.parse(box.get('lastClickTime'))
//                   : null;
//
//               if (lastClickTime != null &&
//                   DateTime.now().difference(lastClickTime).inHours < 24) {
//                 Duration remainingTime = const Duration(hours: 24) - DateTime.now().difference(lastClickTime!);
//                 String remainingTimeString = "${remainingTime.inHours} hours ${remainingTime.inMinutes.remainder(60)} minutes ${remainingTime.inSeconds.remainder(60)} seconds";
//                 AwesomeDialog(
//                   context: context,
//                   dialogType: DialogType.info,
//                   animType: AnimType.bottomSlide,
//                   title: 'Info',
//                   desc: 'Please wait for $remainingTimeString',
//                   btnOkOnPress: () {},
//                 ).show();
//               } else {
//                 box.put('lastClickTime', DateTime.now().toIso8601String());
//                 // Your button click logic here
//               }
//             },
// //             child: const Text('Click me'),
// //           ),
// //           const SizedBox(
// //             height: 100,
// //           ),
// //           const SizedBox(
// //             height: 100,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

//00


// import 'dart:async';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Cubits/count/countdown_cubit.dart';
// import 'package:flutter_auth/Pages/Login_Page.dart';
// import 'package:flutter_auth/Pages/Sign_Up_Page.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
//
// import 'Gnav.dart';
//
// class TestCountDown extends StatelessWidget {
//   const TestCountDown({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => Count(),
//       child: TestCountDownView(),
//     );
//   }
// }
//
// class TestCountDownView extends StatefulWidget {
//   @override
//   _TestCountDownViewState createState() => _TestCountDownViewState();
// }
//
// class _TestCountDownViewState extends State<TestCountDownView> {
//   Timer? _timer;
//   Duration remainingTime = Duration(hours: 24);
//
//   void startTimer() {
//     const oneSec = const Duration(seconds: 1);
//     _timer = new Timer.periodic(
//       oneSec,
//           (Timer timer) {
//         if (remainingTime == Duration.zero) {
//           timer.cancel();
//         } else {
//           setState(() {
//             remainingTime -= oneSec;
//           });
//         }
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 100,
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               var box = await Hive.openBox('myBox');
//               DateTime? lastClickTime = box.get('lastClickTime') != null
//                   ? DateTime.parse(box.get('lastClickTime'))
//                   : null;
//
//               if (lastClickTime != null &&
//                   DateTime.now().difference(lastClickTime).inHours < 24) {
//                 remainingTime = Duration(hours: 24) - DateTime.now().difference(lastClickTime!);
//                 startTimer();
//               } else {
//                 box.put('lastClickTime', DateTime.now().toIso8601String());
//                 // Your button click logic here
//               }
//             },
//             child: Text("${remainingTime.inHours.toString().padLeft(2, '0')}:${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}:${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}"),
//           ),
//           const SizedBox(
//             height: 100,
//           ),
//           const SizedBox(
//             height: 100,
//           ),
//         ],
//       ),
//     );
//   }
// }
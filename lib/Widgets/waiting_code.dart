// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../Cubits/CountDownCubit/count_down_cubit.dart';
// import '../../../Widgets/count_down_button.dart';
//
// class CustomSliderCard extends StatelessWidget {
//   const CustomSliderCard({
//     super.key,
//     required this.coins,
//     required this.buttonText,
//     required this.mainIcon,
//     required this.mainText,
//     required this.mainSecondText,
//     required this.padding,
//     required this.onPressed,
//     required this.buttonKey,
//   });
//
//   final String coins;
//   final String buttonText;
//   final String mainIcon;
//   final String mainText;
//   final String mainSecondText;
//   final double padding;
//   final VoidCallback onPressed;
//   final String buttonKey;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CountDownCubit, CountDownState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: padding),
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Container(
//                 height: 130,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 2,
//                       spreadRadius: 2,
//                     ),
//                   ],
//                   border: Border.all(
//                     color: Colors.white.withOpacity(0.2),
//                     width: 2,
//                   ),
//                   color: const Color(0xff3e2b53).withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   color: Color(0xff3e2b53),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                 ),
//                 height: 50,
//               ),
//               Positioned(
//                 bottom: 10,
//                 left: 10,
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       width: 30,
//                       height: 30,
//                       'assets/icons/coin.png',
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       coins,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 bottom: 6,
//                 right: 10,
//                 child: SizedBox(
//                   height: 40,
//                   width: 115,
//                   child: Card(
//                     elevation: 5,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xff138745),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: onPressed,
//                       child: state is CountdownInProgress
//                           ? Text(
//                         '${state.remainingTime.inHours.remainder(60).toString().padLeft(2, '0')}:${state.remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}:${state.remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                         ),
//                       )
//                           : Text(
//                         buttonText,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 15,
//                 left: 20,
//                 child: Row(
//                   children: [
//                     Image.asset(
//                       mainIcon,
//                       height: 70,
//                       width: 50,
//                     ),
//                     const SizedBox(
//                       width: 30,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           mainText,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           mainSecondText,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


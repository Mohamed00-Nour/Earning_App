// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Pages/Sign_Up_Page.dart';
//
// import '../../../Models/hot_now_card_model.dart';
// import 'hot_now_card.dart';
//
// class HotNowCardBuilder extends StatelessWidget {
//    HotNowCardBuilder({
//     super.key,
//   });
//
//    List<HotNowCardModel> hotNowCardModel = [
//      HotNowCardModel(
//        image: 'assets/icons/internet.png',
//        title: 'Visit',
//        subtitle: 'visit for 30 sec',
//        coin: 20,
//        routeName: SignUpPage.id,
//      ),
//      HotNowCardModel(
//        image: 'assets/icons/joystick.png',
//        title: 'Games',
//        subtitle: 'play for 30 sec',
//        coin: 20,
//      ),
//      HotNowCardModel(
//        image: 'assets/icons/fortune-wheel.png',
//        title: 'Spin',
//        subtitle: 'spin for 30 sec',
//        coin: 20,
//      ),
//      HotNowCardModel(
//        image: 'assets/icons/referral.png',
//        title: 'Refer Task',
//        subtitle: 'refer for 30 sec',
//        coin: 20,
//      ),
//      HotNowCardModel(
//        image: 'assets/icons/betting.png',
//        title: 'Scratch Card',
//        subtitle: 'scratch for 30 sec',
//        coin: 20,
//      ),
//       HotNowCardModel(
//         image: 'assets/icons/watching.png',
//         title: 'Watch Videos',
//         subtitle: 'watch for 30 sec',
//         coin: 20,
//       ),
//    ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: hotNowCardModel.length,
//         itemBuilder: (context, index) {
//           return  GestureDetector(
//             onTap: hotNowCardModel[index].routeName != null
//                 ? () => Navigator.pushNamed(context, hotNowCardModel[index].routeName!)
//                 : null,
//             child: HotNowCard(
//               index: index,
//               hotModel: hotNowCardModel [index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Pages/Sign_Up_Page.dart';
// import 'package:flutter_auth/Pages/Visit%20Card/Components/visit_card_item.dart';
// import '../../../Models/visit_card_model.dart';
//
//
// class VisitBuilder extends StatelessWidget {
//    VisitBuilder({super.key});
//
//    List<VisitCardModel> visitCardList = [
//       VisitCardModel(
//         image: 'assets/icons/internet.png',
//         title: 'VISIT',
//         subtitle: 'visit for 30 sec',
//         coin: 20,
//         routeName: SignUpPage.id,
//       ),
//       VisitCardModel(
//         image: 'assets/icons/internet.png',
//         title: 'VISIT',
//         subtitle: 'visit for 30 sec',
//         coin: 20,
//       ),
//       VisitCardModel(
//         image: 'assets/icons/internet.png',
//         title: 'VISIT',
//         subtitle: 'visit for 30 sec',
//         coin: 20,
//       ),
//       VisitCardModel(
//         image: 'assets/icons/internet.png',
//         title: 'VISIT',
//         subtitle: 'visit for 30 sec',
//         coin: 20,
//       ),
//       VisitCardModel(
//         image: 'assets/icons/internet.png',
//         title: 'VISIT',
//         subtitle: 'visit for 30 sec',
//         coin: 20,
//         routeName: SignUpPage.id,
//       ),
//     ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: visitCardList.length,
//         itemBuilder: (context, index) {
//           return  GestureDetector(
//             onTap: visitCardList[index].routeName != null
//                 ? () => Navigator.pushNamed(context, visitCardList[index].routeName!)
//                 : null,
//             child: VisitCardItem(
//               index: index,
//               visitCardModel: visitCardList[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

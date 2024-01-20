// import 'package:flutter/material.dart';
//
//
// import '../../../Classes/extender.dart';
// import '../../Sign_Up_Page.dart';
// import 'games_card_item.dart';
//
// class GamesCardBuilder extends StatelessWidget {
//    GamesCardBuilder({super.key});
//
//   List<GamesCardModel> gamesCardList = [
//     GamesCardModel(
//       image: 'assets/icons/internet.png',
//       title: 'GAMES',
//       subtitle: 'play for 30 sec',
//       coin: 20,
//       routeName: SignUpPage.id,
//     ),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: gamesCardList.length,
//         itemBuilder: (context, index) {
//           return  GestureDetector(
//             onTap: gamesCardList[index].routeName != null
//                 ? () => Navigator.pushNamed(context, gamesCardList[index].routeName!)
//                 : null,
//             child: GamesCardItem(
//               index: index,
//               gamesCardModel: gamesCardList[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

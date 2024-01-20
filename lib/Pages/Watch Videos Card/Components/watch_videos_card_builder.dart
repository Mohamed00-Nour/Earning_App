// import 'package:flutter/material.dart';
// import 'package:flutter_auth/Pages/Watch%20Videos%20Card/Components/watch_videos_item.dart';
//
//
// import '../../../Classes/extender.dart';
// import '../../Sign_Up_Page.dart';
//
// class WatchVideosBuilder extends StatelessWidget {
//    WatchVideosBuilder({super.key});
//
//   List<WatchVideosModel> watchVideosList = [
//     WatchVideosModel(
//       image: 'assets/icons/internet.png',
//       title: 'WATCH VIDEOS',
//       subtitle: 'watch for 30 sec',
//       coin: 20,
//     ),
//     WatchVideosModel(
//       image: 'assets/icons/internet.png',
//       title: 'WATCH VIDEOS',
//       subtitle: 'watch for 30 sec',
//       coin: 20,
//     ),
//     WatchVideosModel(
//       image: 'assets/icons/internet.png',
//       title: 'WATCH VIDEOS',
//       subtitle: 'watch for 30 sec',
//       coin: 20,
//     ),
//     WatchVideosModel(
//       image: 'assets/icons/internet.png',
//       title: 'WATCH VIDEOS',
//       subtitle: 'watch for 30 sec',
//       coin: 20,
//     ),
//     WatchVideosModel(
//       image: 'assets/icons/internet.png',
//       title: 'WATCH VIDEOS',
//       subtitle: 'watch for 30 sec',
//       coin: 20,
//       routeName: SignUpPage.id,
//     ),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.builder(
//         itemCount: watchVideosList.length,
//         itemBuilder: (context, index) {
//           return  GestureDetector(
//             onTap: watchVideosList[index].routeName != null
//                 ? () => Navigator.pushNamed(context, watchVideosList[index].routeName!)
//                 : null,
//             child: WatchVideosItem(
//               index: index,
//                watchVideosModel: watchVideosList[index],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

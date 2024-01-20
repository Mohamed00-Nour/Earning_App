import 'package:flutter/material.dart';
import 'package:flutter_auth/Pages/Gnav.dart';
import 'package:flutter_auth/Pages/Sign_Up_Page.dart';
import '../../Classes/builder_class.dart';
import '../../Classes/extender.dart';
import '../Login_Page.dart';
import 'Games Components/games_card_item.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});
  static const  id = 'GamesPage';

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments;
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff301b49),
              Color(0xff27123a),
              Color(0xff1a0b28),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff3e2b53),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, GNavPage.id ,arguments: email);
                      },
                      color: Colors.white,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  const Text(
                    'Games',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 300),
            Text("Coming Soon...",style: TextStyle(color: Colors.white,fontSize: 30),),
            // GenericListBuilder(
            //   itemList: [
            //     GamesCardModel(
            //       image: 'assets/icons/internet.png',
            //       title: 'GAMES',
            //       subtitle: 'play for 30 sec',
            //       coin: 20,
            //       routeName: SignUpPage.id,
            //     ),
            //   ],
            //   itemBuilder: (context, index, item) {
            //     if (item is GamesCardModel) {
            //       return GestureDetector(
            //         onTap: item.routeName != null
            //             ? () => Navigator.pushNamed(context, item.routeName!)
            //             : null,
            //         child: GamesCardItem(
            //           index: index,
            //           gamesCardModel: item,
            //         ),
            //       );
            //     }
            //     return Container(
            //       color: Colors.red,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../Refer Task/refer_task.dart';
import '../../../card_model.dart';
import '../../Games Card/games_card_page.dart';
import '../../ScrachCardPage/scretch_card_page.dart';
import '../../Spin Page/spin_page.dart';
import '../../Visit Card/visit_card_page.dart';
import '../../Watch Videos Card/watch_videos_page.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.hotIcon, this.email,
  });

  final IconData hotIcon;
  final email;

  List<CardModel> cards = [
    CardModel(
      imageHeight: 70,
      imageWidth: 60,
      text: 'VISIT',
      image: 'assets/icons/internet.png',
      showIcon: true,
      routeName: VisitPage.id,
    ),
    CardModel(
      imageHeight: 70,
      imageWidth: 60,
      text: 'Games',
      image: 'assets/icons/joystick.png',
      showIcon: true,
      routeName: GamesPage.id,
    ),
    CardModel(
      imageHeight: 70,
      imageWidth: 60,
      text: 'Spin',
      image: 'assets/icons/fortune-wheel.png',
      routeName: SpinPage.id,
    ),
    CardModel(
      imageHeight: 70,
      imageWidth: 60,
      text: 'Refer Task',
      image: 'assets/icons/referral.png',
      routeName: ReferTask.id,
    ),
    CardModel(
      imageHeight: 70,
      imageWidth: 60,
      text: 'Scratch Card',
      image: 'assets/icons/betting.png',
      routeName: ScratchCardPage.id,
    ),
    CardModel(
      imageHeight: 70,
      imageWidth: 60,
      text: 'Watch Videos',
      image: 'assets/icons/watching.png',
      showIcon: true,
      routeName: WatchVideosCard.id,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: GridView.builder(
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: cards[index].routeName != null
                    ? () => Navigator.pushNamed(context, cards[index].routeName! ,
                  arguments: email,
                ) : (){},
                child: Stack(
                  children: [
                    Card(
                      elevation: 10,
                      color: const Color(0xff3e2b53),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              width: cards[index].imageWidth,
                              height: cards[index].imageHeight,
                              cards[index].image,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              cards[index].text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (cards[index].showIcon)
                      Positioned(
                        top: 0,
                        right: 0,
                        left: -87,
                        bottom: 87,
                        child: Icon(
                          hotIcon,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
//here
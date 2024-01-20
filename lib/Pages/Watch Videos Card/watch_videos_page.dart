import 'package:flutter/material.dart';
import '../../Classes/builder_class.dart';
import '../../Classes/extender.dart';
import '../Gnav.dart';
import '../Sign_Up_Page.dart';
import 'Components/watch_videos_item.dart';

class WatchVideosCard extends StatelessWidget {
  const WatchVideosCard({super.key});
  static const String id = 'WatchVideosCard';

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Navigator.pushNamed(context, GNavPage.id);
                      },
                      color: Colors.white,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  const Text(
                    'Watch Videos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GenericListBuilder(
              itemList:  [
                WatchVideosModel(
                  image: 'assets/icons/internet.png',
                  title: 'WATCH VIDEOS',
                  subtitle: 'watch for 30 sec',
                  coin: 20,
                  routeName: SignUpPage.id,
                ),
              ],
              itemBuilder: (context, index, item) {
                if (item is WatchVideosModel) {
                  return GestureDetector(
                    onTap: item.routeName != null
                        ? () => Navigator.pushNamed(context, item.routeName!)
                        : null,
                    child: WatchVideosItem(
                      index: index,
                      watchVideosModel: item,
                    ),
                  );
                }
                return Container(
                  color: Colors.red,
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

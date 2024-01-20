import 'package:flutter/material.dart';
import 'package:flutter_auth/Classes/extender.dart';
import 'package:flutter_auth/Pages/Gnav.dart';
import '../../Classes/builder_class.dart';
import '../Sign_Up_Page.dart';
import 'Components/hot_now_card.dart';

class HotNow extends StatelessWidget {
  const HotNow({super.key});
  static const String id = 'HotNow';

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;
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
                      onPressed:(){
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
                    width: 80,
                  ),
                  const Text(
                    'Hot Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.local_fire_department_rounded,
                    size: 30,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            GenericListBuilder(
              itemList:  [
                HotNowCardModel(
                  image: 'assets/icons/internet.png',
                  title: 'Hot Now',
                  subtitle: 'visit for 30 sec',
                  coin: 20,
                  routeName: SignUpPage.id,
                ),

              ],
              itemBuilder: (context, index, item) {
                if (item is HotNowCardModel) {
                  return GestureDetector(
                    onTap: item.routeName != null
                        ? () => Navigator.pushNamed(context, item.routeName!)
                        : null,
                    child: HotNowCard(
                      index: index,
                      hotModel: item,
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


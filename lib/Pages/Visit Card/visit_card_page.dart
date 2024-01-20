import 'package:flutter/material.dart';
import 'package:flutter_auth/Cubits/CountDownCubit/count_down_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Classes/builder_class.dart';
import '../../Classes/extender.dart';
import '../Gnav.dart';
import '../Sign_Up_Page.dart';
import '../Web/visit_web_view.dart';
import 'Components/visit_card_item.dart';

class VisitPage extends StatelessWidget {
  const VisitPage({super.key});

  static const id = 'VisitPage';

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
                      onPressed: () {
                        Navigator.pushNamed(context, GNavPage.id,
                            arguments: email);
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
                    'VISIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            GenericListBuilder(
              itemList: [
                VisitCardModel(
                  image: 'assets/icons/internet.png',
                  title: 'VISIT',
                  subtitle: 'visit for 30 sec',
                  coin: 20,
                  buttonKey: 'visit1',
                  initialUrl: 'https://creators.nafezly.com/u/mohamednour/best-ps4-emulator-for-android',
                  destinationUrl: 'https://creators.nafezly.com/u/mohamednour/best-ps4-emulator-for-android',
                ),
                VisitCardModel(
                  image: 'assets/icons/internet.png',
                  title: 'VISIT',
                  subtitle: 'visit for 30 sec',
                  coin: 10,
                  buttonKey: 'visit2',
                  initialUrl: 'https://apklogic.com/onl-ine/',
                  destinationUrl: 'https://apklogic.com/onl-ine/',
                ),
                VisitCardModel(
                  image: 'assets/icons/internet.png',
                  title: 'VISIT',
                  subtitle: 'visit for 30 sec',
                  coin: 10,
                  buttonKey: 'visit3',
                  initialUrl: 'https://games2kings.com/creators/mohamed-nour-154',
                  destinationUrl: 'https://games2kings.com/creators/mohamed-nour-154',
                ),
              ],
              itemBuilder: (context, index, item) {
                if (item is VisitCardModel) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, VisitWebView.id,
                          arguments:
                          {
                            'email': email,
                            'initialUrl': item.initialUrl,
                            'destinationUrl': item.destinationUrl,
                          }
                          );
                    },
                    child: VisitCardItem(
                      index: index,
                      visitCardModel: item,
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

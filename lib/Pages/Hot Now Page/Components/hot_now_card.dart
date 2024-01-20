import 'package:flutter/material.dart';

import '../../../Classes/extender.dart';
import '../../../constants.dart';
class HotNowCard extends StatelessWidget {
  HotNowCard({super.key,  required this.index,  required this.hotModel, });

  final int index;
  final HotNowCardModel hotModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Stack(
        children: [
          Card(
            elevation: 5,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff502479),
                    kSecondaryColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            right: 10,
            child: SizedBox(
              height: 50,
              width: 120,
              child: Card(
                color: const Color(0xff138745),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
                child: Center(
                  child: Text(
                    '+${hotModel.coin}  Coins',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: Image.asset(
              hotModel.image,
              width: 70,
              height: 60,
            ),
          ),
           Positioned(
            top: 30,
            left: 100,
            child: Text(
             hotModel.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
           Positioned(
            top: 50,
            left: 100,
            child: Text(
              hotModel.subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

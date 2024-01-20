import 'package:flutter/material.dart';


import '../../../Classes/extender.dart';
import '../../../constants.dart';

class WatchVideosItem extends StatelessWidget {
  const WatchVideosItem({super.key, required this.index, required this.watchVideosModel});
  final int index;
  final WatchVideosModel watchVideosModel;

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
                    '+${watchVideosModel.coin}  Coins',
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
              watchVideosModel.image,
              width: 70,
              height: 60,
            ),
          ),
          Positioned(
            top: 30,
            left: 100,
            child: Text(
              watchVideosModel.title,
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
              watchVideosModel.subtitle,
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

import 'package:flutter/material.dart';

import '../../../constants.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({
    super.key,

    required this.maiIcon,
    required this.textInfo,
    required this.subIcon,
    required this.mainIconColor,
    required this.onTap, this.backgroundColor,
  });

  final IconData maiIcon;
  final String textInfo;
  final IconData subIcon;
  final Color mainIconColor;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration:  BoxDecoration(
            color: textInfo == 'Delete Account' ? Colors.red :  const Color(0xff3e2b53),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: Icon(
                    maiIcon,
                    color: mainIconColor,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                textInfo,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Spacer(),
              Icon(
                subIcon,
                color: Colors.white,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:async';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:scratcher/widgets.dart';
import '../Gnav.dart';

class ScratchCardPage extends StatefulWidget {
  const ScratchCardPage({super.key});

  static const String id = 'ScratchCardPage';

  @override
  State<ScratchCardPage> createState() => _ScratchCardPageState();
}

class _ScratchCardPageState extends State<ScratchCardPage> {
  bool _enabled = true;
  List<int> numbers = [1, 2, 3, 5, 6, 10];
  int? randomNumber;
  final scratchKey = GlobalKey<ScratcherState>();
  int counter = 2;
  bool hasReachedThreshold = false;
  int _remainingTimeInSeconds = 0;
  Timer? _countdownTimer;

  void startCountdownTimer() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTimeInSeconds > 0) {
          _remainingTimeInSeconds--;
        } else {
          _countdownTimer!.cancel();
          counter = 10; // Reset counter to 10 after 24 hours
        }
      });
    });
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void initState() {
    super.initState();
    randomNumber = numbers[Random().nextInt(numbers.length)];
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }



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
            if (counter == 0)
              Text(
                'Remaining Time: ${formatTime(_remainingTimeInSeconds)}',
                style: const TextStyle(fontSize: 20),
              ),
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
                        Navigator.pushNamed(context, GNavPage.id , arguments: email);
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
                    'Scratch Card',
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
              height: 30,
            ),
            const Text('Luck is on your side today!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            Text('Your Today Scratchs left: $counter',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),),
            const SizedBox(
              height: 50,
            ),
            Scratcher(
              key: scratchKey,
              image: const Image(
                image: AssetImage('assets/icons/trophy.png'),
              ),
              enabled: _enabled,
              threshold: 60,
              color: kSecondaryColor,
              onThreshold: () {
                setState(() {
                  _enabled = false;
                  if (!hasReachedThreshold && counter > 0) {
                    hasReachedThreshold = true;
                    counter--;
                    if (counter == 0) {
                      _remainingTimeInSeconds = 86400; // Reset countdown to 24 hours
                      startCountdownTimer();
                    }
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.bottomSlide,
                      title: 'Congratulations!',
                      desc: 'You won $randomNumber points!',
                      btnOkOnPress: () {},
                    ).show();
                  } else if (counter == 0) {
                    setState(() {
                      _enabled = false;
                      _remainingTimeInSeconds = 86400;
                      startCountdownTimer();
                      Text(
                        'Remaining Time: ${formatTime(_remainingTimeInSeconds)}',
                        style: const TextStyle(fontSize: 20),
                      );
                    });
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.bottomSlide,
                      title: 'Daily Limit Reached',
                      desc: 'Your daily scratches are over. Please come back in 24 hours.',
                      btnOkOnPress: () {},
                      btnOkColor: Colors.red,
                    ).show();
                  }
                });
              },
              brushSize: 40,
              accuracy: ScratchAccuracy.low,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.white,
                child:  Center(
                  child: Text(
                    randomNumber != null ? randomNumber.toString() : '',
                    // display randomNumber
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    scratchKey.currentState!.reset();
                    _enabled = true;
                    hasReachedThreshold = false;
                    randomNumber = numbers[Random().nextInt(numbers.length)]; // reset randomNumber

                  });
                },
                child: const Text('Get New Card'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

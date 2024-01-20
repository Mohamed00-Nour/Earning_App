import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_auth/Pages/Hot%20Now%20Page/hot_now_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../Cubits/CountDownCubit/count_down_cubit.dart';
import '../../Cubits/GetDataByUserEmailCubit/get_data_by_user_email_cubit.dart';
import '../../Cubits/TaskCompletionCubit/task_completion_cubit.dart';
import '../../Cubits/TimerCubbit/timer_cubit.dart';
import '../../Utils.dart';
import '../../Widgets/show_awesomedialog.dart';
import '../../time_manager.dart';
import 'Components/Header.dart';
import 'Components/custom_card.dart';
import 'Components/custom_slider_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.email});

  static const String id = 'HomePage';
  final String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isButtonEnabled = true;
  TimerManager? timerManager;

  final String hiveKey3 = 'Button3';

  @override
  Widget build(BuildContext context) {
    final taskCompletionCubit = BlocProvider.of<TaskCompletionCubit>(context);
    final email = ModalRoute.of(context)?.settings.arguments as String;
    final getDataByUserEmailCubit =
        BlocProvider.of<GetDataByUserEmailCubit>(context);
    getDataByUserEmailCubit.getUserDataByEmail(email);
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              Header(
                email: email,
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 140.0,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 1.0,
                  enlargeCenterPage: true,
                ),
                items: [
                  CustomSliderCard(
                    buttonKey: '1',
                    onPressed: () => Utils.handleButtonPress(
                        context, 'Daily Bonus', 5, taskCompletionCubit, email),
                    padding: 0,
                    coins: '5 Coins',
                    buttonText: 'Claim',
                    mainIcon: 'assets/icons/giftbox.png',
                    mainText: 'Daily Bonus',
                    mainSecondText: 'Claim your daily bonus',
                  ),
                  CustomSliderCard(
                    buttonKey: '8',
                    onPressed: () {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Congratulations',
                        text: 'You have earned 10 coins',
                          );
                    },
                    padding: 10,
                    coins: '∞ Coins',
                    buttonText: 'Subscribe',
                    mainIcon: 'assets/icons/youtube.png',
                    mainText: 'SUBSCRIBE',
                    mainSecondText: 'Subscribe to our youtube channel',
                  ),
                  CustomSliderCard(
                    buttonKey: '4',
                    onPressed: () {},
                    padding: 0,
                    coins: '∞ Coins',
                    buttonText: 'Follow',
                    mainIcon: 'assets/icons/facebook.png',
                    mainText: 'FOLLOW',
                    mainSecondText: 'Follow our Facebook page',
                  ),
                  CustomSliderCard(
                    buttonKey: '2',
                    onPressed: () {},
                    padding: 0,
                    coins: '∞ Coins',
                    buttonText: 'Visit',
                    mainIcon: 'assets/icons/internet.png',
                    mainText: 'VISIT',
                    mainSecondText: 'visit Our Website',
                  ),
                ],
              ),
              CustomCard(
                email: email,
                hotIcon: Icons.local_fire_department,
              ),
              Container(
                color: const Color(0xff1a0b28),
                width: MediaQuery.of(context).size.width,
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          color: Colors.orange,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Hot',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, HotNow.id);
                      },
                      child: const Row(
                        children: [
                          Text(
                            'more',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 140.0,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 5,
                ),
                items: [
                  CustomSliderCard(
                    buttonKey: '5',
                    onPressed: () => Utils.handleButtonPress(
                        context, 'Visitt', 10, taskCompletionCubit, email),
                    padding: 10,
                    coins: '30 Coins',
                    buttonText: 'Visitt',
                    mainIcon: 'assets/icons/internet.png',
                    mainText: 'VISIT',
                    mainSecondText: 'Visit our website',
                  ),
                  CustomSliderCard(
                    buttonKey: '6',
                    onPressed: () {
                      taskCompletionCubit.completeTask(email, 10);
                    },
                    padding: 10,
                    coins: '30 Coins',
                    buttonText: 'Visit',
                    mainIcon: 'assets/icons/internet.png',
                    mainText: 'VISIT',
                    mainSecondText: 'Visit our website',
                  ),
                  CustomSliderCard(
                    buttonKey: '7',
                    onPressed: () async {
                      var box = await Hive.openBox('myBox');
                      DateTime? lastClickTime = box.get(hiveKey3) != null
                          ? DateTime.parse(box.get(hiveKey3))
                          : null;
                      if (lastClickTime != null &&
                          DateTime.now().difference(lastClickTime).inSeconds <
                              20) {
                        Duration remainingTime = const Duration(seconds: 20) -
                            DateTime.now().difference(lastClickTime!);
                        String remainingTimeString =
                            "${remainingTime.inHours} hours ${remainingTime.inMinutes.remainder(60)} minutes ${remainingTime.inSeconds.remainder(60)} seconds";
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.bottomSlide,
                          title: 'Info',
                          desc: 'Please wait for $remainingTimeString',
                          btnOkOnPress: () {},
                        ).show();
                      } else {
                        box.put(hiveKey3, DateTime.now().toIso8601String());
                        taskCompletionCubit.completeTask(email, 10);
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.bottomSlide,
                          title: 'Congratulations',
                          desc: 'You have earned 10 coins',
                          btnOkOnPress: () {},
                        ).show();
                      }
                    },
                    padding: 10,
                    coins: '30 Coins',
                    buttonText: 'Visit',
                    mainIcon: 'assets/icons/internet.png',
                    mainText: 'VISIT',
                    mainSecondText: 'Visit our website',
                  ),
                  CustomSliderCard(
                    buttonKey: '8',
                    onPressed: () => Utils.handleButtonPress(
                        context, 'subscribe', 10, taskCompletionCubit, email),
                    padding: 10,
                    coins: '40 Coins',
                    buttonText: 'Claim',
                    mainIcon: 'assets/icons/youtube.png',
                    mainText: 'SUBSCRIBE',
                    mainSecondText: 'Subscribe to our youtube channel',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

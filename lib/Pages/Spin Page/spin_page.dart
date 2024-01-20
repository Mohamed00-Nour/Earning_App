
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Cubits/spin_cubit/spin_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import '../../Cubits/TaskCompletionCubit/task_completion_cubit.dart';
import '../../constants.dart';
import '../Gnav.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({super.key});

  static const String id = 'SpinPage';

  @override
  State<SpinPage> createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  final List<int> items = [1, 2, 0, 10, 5, 0];

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;
    final taskCompletionCubit = BlocProvider.of<TaskCompletionCubit>(context);
    return BlocConsumer<SpinCubit, SpinState>(
      listener: (context, state) {
        if (state is SpinSuccess) {
          taskCompletionCubit.completeTask(email, state.reward);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.bottomSlide,
            title: 'Congratulations!',
            desc: 'You won ${state.reward} points!',
            btnOkOnPress: () {},
          ).show();
        } else if (state is SpinLimitReached) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.bottomSlide,
            title: 'Daily Limit Reached',
            desc:
                'Your daily scratches are over. Please come back in 24 hours.',
            btnOkOnPress: () {},
            btnOkColor: Colors.red,
          ).show();
        }
      },
      builder: (context, state) {
        bool isButtonEnabled = true;
        if (state is SpinLimitReachedWithTime || state is SpinInProgress) {
          isButtonEnabled = false;
        }
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
                        width: 100,
                      ),
                      const Text(
                        'Spin',
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
                  height: 20,
                ),
                const Text(
                  'Luck is on your side today!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Your Today Spins left: ${context.watch<SpinCubit>().counter}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 300,
                  width: 300,
                  child: FortuneWheel(
                    animateFirst: false,
                    selected: context.watch<SpinCubit>().selected.stream,
                    items: [
                      for (int i = 0; i < items.length; i++)
                        FortuneItem(
                          child: Text(
                            items[i].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                    onAnimationEnd: () {
                      context.read<SpinCubit>().spinEnded();
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 15,
                      backgroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: isButtonEnabled
                        ? () {
                            context.read<SpinCubit>().startSpin();
                          }
                        : (){}  ,
                    child: const Text('Spin'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                state is SpinLimitReachedWithTime
                    ? Text(
                        'Please wait ${state.remainingTime.inHours}:${state.remainingTime.inMinutes.remainder(60)}:${state.remainingTime.inSeconds.remainder(60)} until next spin',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}

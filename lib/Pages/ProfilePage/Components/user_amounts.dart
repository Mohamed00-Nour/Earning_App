import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Cubits/GetDataByUserEmailCubit/get_data_by_user_email_cubit.dart';

class UserAmountsProfile extends StatelessWidget {
  const UserAmountsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataByUserEmailCubit, GetDataByUserEmailState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<GetDataByUserEmailCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/coin.png',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Balance',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  StreamBuilder<Map<String, dynamic>>(
                      stream: cubit.userDataStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final userData = snapshot.data!;
                          return Text(
                            '${userData['Revenue']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const Text('No Data' , style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),);
                        }
                      }
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/wallet.png',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Total Earned',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  StreamBuilder<Map<String, dynamic>>(
                      stream: cubit.userDataStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final userData = snapshot.data!;
                          return Text(
                            '${userData['Revenue']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const Text('No Data' , style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),);
                        }
                      }
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 60,
                width: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/withdrawal.png',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Redeemed',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_auth/Pages/ProfilePage/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubits/GetDataByUserEmailCubit/get_data_by_user_email_cubit.dart';

class Header extends StatelessWidget {
  const Header({
    super.key, required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataByUserEmailCubit, GetDataByUserEmailState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<GetDataByUserEmailCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfilePage.id , arguments: email);
                    },
                    child: Image.asset(
                      width: 50,
                      height: 50,
                      'assets/icons/mans.png',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      StreamBuilder<Map<String, dynamic>>(
                          stream: cubit.userDataStream,
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              final userData = snapshot.data!;
                              return Text(
                                '${userData['name']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }else{
                              return const Text('No Data');
                            }
                          }
                      ),

                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ProfilePage.id , arguments: email);
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 33,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xff3e2b53),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Positioned(
                      right: 25,
                      bottom: -13,
                      child: Row(
                        children: [
                          Image.asset(
                            width: 37,
                            height: 60,
                            'assets/icons/coin.png',
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          StreamBuilder<Map<String, dynamic>>(
                              stream: cubit.userDataStream,
                              builder: (context, snapshot) {
                                if(snapshot.hasData){
                                  final userData = snapshot.data!;
                                  return Text(
                                    '${userData['Revenue']}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }else{
                                  return const Text('No Data');
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

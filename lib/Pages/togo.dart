import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth/Cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Login_Page.dart';
import 'Sign_Up_Page.dart';
class UserModel {
  final String name;
  final String email;
  int Revenue;

  UserModel({required this.name, required this.email, required this.Revenue});

  UserModel.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        email = map['email'],
        Revenue = map['Revenue'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'Revenue': Revenue,
    };
  }
}

class BalanceWidget extends StatefulWidget {
  static String id = 'BalanceWidget';

  const BalanceWidget({Key? key}) : super(key: key);

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  void incrementBalance(String? userId) {
    final usersRef = FirebaseFirestore.instance.collection('users');
    usersRef.doc(id).get().then((doc) {
      if (doc.exists) {
        int currentBalance = doc.data()?['Revenue'] ?? 0;
        usersRef.doc(id).update({'Revenue': currentBalance + 1});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments;
    return BlocProvider(
      create: (context) => SignOutCubit(),
      child: BlocConsumer<SignOutCubit, SignOutState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            Navigator.pushNamed(
                context, LoginPage.id);
          } else if (state is SignOutFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Balance'),
            ),
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    incrementBalance(id);
                  },
                  child: const Text("Increment Balance"),
                ),
                const SizedBox(height: 20),
                StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(id)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something went wrong");
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }

                    if (snapshot.data != null && snapshot.data!.exists) {
                      UserModel user = UserModel.fromMap(
                          snapshot.data!.data() as Map<String, dynamic>);
                      return Text("Balance: ${user.Revenue} $id");
                    } else {
                      return const Text("No data");
                    }
                  },
                ),
                Text("Name: $email"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<SignOutCubit>().signOut();
                  },
                  child: const Text("Log Out"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

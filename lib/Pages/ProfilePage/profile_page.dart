import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Pages/Login_Page.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Cubits/AccountDeleteCubit/account_deletion_cubit.dart';
import '../../Cubits/GetDataByUserEmailCubit/get_data_by_user_email_cubit.dart';
import '../../Cubits/sign_out_cubit/sign_out_cubit.dart';
import '../Gnav.dart';
import '../Home Page/home_page.dart';
import 'Components/header.dart';
import 'Components/info_profile.dart';
import 'Components/user_amounts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.email});

  static const String id = 'ProfilePage';
  final String email;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  void _showReauthenticateDialog(BuildContext context) {
    String email = '';
    String password = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          title: const Text('Re-authenticate'),
          content: SizedBox(
            width: 400,
            height: 200,
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    fillColor: kPrimaryLightColorForm,
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                if (email.isEmpty || password.isEmpty) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.bottomSlide,
                    title: 'Re-authenticate',
                    desc: 'Please enter your email and password',
                    btnOkOnPress: () {},
                    btnOkColor: Colors.red,
                  ).show();
                  return;
                }
                context.read<AccountDeletionCubit>().deleteAccount(email, password);
                Navigator.pushNamed(context, LoginPage.id);
              },
            ),
          ],
        );
      },
    );
  }
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop();
                _showReauthenticateDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _onTapDelete() {
    _showDeleteDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignOutCubit>(
          create: (context) => SignOutCubit(),
        ),
        BlocProvider<GetDataByUserEmailCubit>(
          create: (context) =>
          GetDataByUserEmailCubit()..getUserDataByEmail(email),
        ),
        BlocProvider<AccountDeletionCubit>(
          create: (context) => AccountDeletionCubit(),
        ),
      ],
      child: BlocConsumer<SignOutCubit, SignOutState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            Navigator.pushNamed(context, LoginPage.id);
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,
              title: 'Sign Out',
              desc: 'Sign Out Successfully',
              btnOkOnPress: () {
              },
            ).show();
          }else if (state is SignOutFailed) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Sign Out Failed',
              desc: '${ state.errMessage}}',
              btnOkOnPress: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
            ).show();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            color: kPrimaryColor,
            inAsyncCall: isLoading,
            child: Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, GNavPage.id , arguments: email);
                              },
                              color: Colors.white,
                              icon: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            const HeaderProfile(),
                            const SizedBox(
                              width: 25,
                            ),
                            IconButton(
                              onPressed: ()async {
                  
                                 isLoading = true;
                                 setState(() {});
                                 try {
                                   await BlocProvider.of<SignOutCubit>(context).signOut();
                                 }  catch (e) {
                                   print(e);
                                 }
                                  isLoading = false;
                                  setState(() {});
                  
                              },
                              icon: const Icon(
                                Icons.exit_to_app_rounded,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const UserAmountsProfile(),
                      const SizedBox(
                        height: 20,
                      ),
                      const InfoProfile(
                        onTap: null,
                        maiIcon: FontAwesomeIcons.receipt,
                        textInfo: 'Terms & Conditions',
                        subIcon: Icons.arrow_forward_ios_rounded,
                        mainIconColor: Colors.yellow,
                      ),
                      const InfoProfile(
                        onTap: null,
                        maiIcon: FontAwesomeIcons.userShield,
                        textInfo: 'Privacy Policy',
                        subIcon: Icons.arrow_forward_ios_rounded,
                        mainIconColor: Colors.blue,
                      ),
                      const InfoProfile(
                        onTap: null,
                        maiIcon: Icons.star,
                        textInfo: 'Rate Us on Play Store',
                        subIcon: Icons.arrow_forward_ios_rounded,
                        mainIconColor: Colors.cyan,
                      ),
                      const InfoProfile(
                        onTap: null,
                        maiIcon: Icons.contact_mail,
                        textInfo: 'Contact Us',
                        subIcon: Icons.arrow_forward_ios_rounded,
                        mainIconColor: Colors.green,
                      ),
                       InfoProfile(
                        backgroundColor: Colors.red,
                          onTap: _onTapDelete,
                          maiIcon: Icons.delete_forever_rounded,
                          textInfo: 'Delete Account',
                          subIcon: Icons.arrow_forward_ios_rounded,
                          mainIconColor: Colors.redAccent),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



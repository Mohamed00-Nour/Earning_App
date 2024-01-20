import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Cubits/forget_password_cubit/forget_password_cubit.dart';
import '../Widgets/Show_SnakBar.dart';
import '../constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  static const id = "ForgotPassword";

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ForgetPasswordCubit(),
  child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
  listener: (context, state) {
if(state is ForgotPasswordSuccess){
      Navigator.pop(context);
      showSnackBar(context, 'Check your email');
    }else if(state is ForgotPasswordFailed){
      showSnackBar(context, 'Something went wrong');
    }else if(state is ForgotPasswordInvalidEmail) {
      showSnackBar(context, 'The email address is badly formatted.');
    }else if(state is ForgotPasswordFailed) {
      showSnackBar(context, 'The user corresponding to the given email has been disabled.');
    }else if(state is ForgotPasswordUserNotFound) {
      showSnackBar(context, 'There is no user corresponding to the given email.');
    }

  },
  builder: (context, state) {
    return ModalProgressHUD(
      color: kPrimaryColor,
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: -10,
                    child: Image.asset(
                      "assets/images/main_top.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    bottom: -20,
                    right: 0,
                    child: Image.asset(
                      "assets/images/login_bottom.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SafeArea(
                      child: ListView(
                    children: [
                      Center(
                        child: Text(
                          "Login".toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 8,
                            child: SvgPicture.asset("assets/icons/Forgot password-amico.svg",
                            height: 320,
                              width: 320,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: defaultPadding),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                const SizedBox(height: defaultPadding),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                    hintText: "Your email",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(defaultPadding),
                                      child: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultPadding),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor: kPrimaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: ()  {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      context.read<ForgetPasswordCubit>().forgotPassword(
                                        email: emailController.text.trim(),
                                      );
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  child: Text("reset password".toUpperCase()),
                                ),
                                const SizedBox(height: defaultPadding),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
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

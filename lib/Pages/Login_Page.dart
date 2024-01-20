import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_auth/Pages/Gnav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'Sign_Up_Page.dart';
import 'forgot_password.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static  String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 final  nameController = TextEditingController();
 final  emailController = TextEditingController();
 final  passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? savedEmail;
  bool obscurePassword = true;

 @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
    listener: (context, state) {
      if(state is SignInSuccess){
        Navigator.pushNamed(context, GNavPage.id , arguments: emailController.text.trim());
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.bottomSlide,
          title: 'Sign In',
          desc: 'Sign In Successfully',
          btnOkOnPress: () {
          },
        ).show();
      }else if(state is SignInFailed){
        Navigator.pushNamed(context, LoginPage.id);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Sign In Failed',
          desc: '${ state.errMessage}}',
          btnOkOnPress: () {
          },
          btnOkColor: Colors.red,
        ).show();
      }else if(state is SignInInvalidEmail) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Sign In Failed',
          desc: 'The email address is not valid.',
          btnOkOnPress: () {
          },
          btnOkColor: Colors.red,
        ).show();
      }else if(state is SignInUserDisabled) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Sign In Failed',
          desc: 'The user corresponding to the given email has been disabled.',
          btnOkOnPress: () {
          },
          btnOkColor: Colors.red,
        ).show();
      }else if(state is SignInUserNotFound) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Sign In Failed',
          desc: 'There is no user corresponding to the given email.',
          btnOkOnPress: () {
          },
          btnOkColor: Colors.red,
        ).show();
      }else if(state is SignInWrongPassword) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Sign In Failed',
          desc: 'The password is invalid for the given email.',
          btnOkOnPress: () {
          },
          btnOkColor: Colors.red,
        ).show();
      }else if(state is SignInFailed) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.bottomSlide,
          title: 'Sign In Failed',
          desc: '${ state.errMessage}}',
          btnOkOnPress: () {
          },
          btnOkColor: Colors.red,
        ).show();
      }
    },
    builder: (context, state) {
      return ModalProgressHUD(
        color: kPrimaryColorForm,
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
                      child: Image.asset("assets/images/login_bottom.png",
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
                              child: SvgPicture.asset("assets/icons/login.svg"),
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
                                    cursorColor: kPrimaryColorForm,
                                    decoration: const InputDecoration(
                                      hintText: "Your email",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(defaultPadding),
                                        child: Icon(Icons.email),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: defaultPadding),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      controller: passwordController,
                                      obscureText: obscurePassword,
                                      cursorColor: kPrimaryColorForm,
                                      decoration:  InputDecoration(
                                        hintText: "Your password",
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.all(defaultPadding),
                                          child: Icon(Icons.lock),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            obscurePassword ? Icons.visibility : Icons.visibility_off,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              obscurePassword = !obscurePassword;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, ForgotPassword.id);
                                        },
                                        child: Text("Forgot Password ?".toUpperCase()),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5, backgroundColor: kPrimaryColorForm,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () async{
                                      if (formKey.currentState!.validate()) {
                                        isLoading = true;
                                        setState(() {});
                                        try {
                                         await context.read<SignInCubit>().signIn(
                                            email: emailController.text.trim(),
                                            password: passwordController.text.trim(),
                                          );
                                        } catch (e) {
                                          print('Sign in failed: $e');
                                        }
                                        isLoading = false;
                                        setState(() {
                                        });
                                      }
                                    },
                                    child: Text("Login".toUpperCase()),
                                  ),
                                  const SizedBox(height: defaultPadding),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Don’t have an account ? ",
                                        style: TextStyle(color: kPrimaryColor),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, SignUpPage.id);
                                        },
                                        child: const Text("SIGN UP" , style:
                                        TextStyle(
                                          color: kPrimaryColorForm,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      )
                                    ],
                                  ),
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
    );
  }
}

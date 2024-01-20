import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import 'Login_Page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static String id = 'SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushNamed(context, LoginPage.id);
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.bottomSlide,
              title: 'Sign Up Success',
              desc: 'Please check your email to verify your account',
              btnOkOnPress: () {
              },
              btnOkColor: Colors.green,
            ).show();
          } else if (state is SignUpFailed) {
            Navigator.pushNamed(context, SignUpPage.id);
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Sign Up Failed',
              desc: '${state.errMessage}',
              btnOkOnPress: () {
              },
              btnOkColor: Colors.red,
            ).show();
          } else if (state is SignUpEmailAlreadyInUse) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Sign Up Failed',
              desc: 'Email already in use',
              btnOkOnPress: () {
              },
              btnOkColor: Colors.red,
            ).show();
          } else if (state is SignUpInvalidEmail) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Sign Up Failed',
              desc: 'Invalid email',
              btnOkOnPress: () {
              },
              btnOkColor: Colors.red,
            ).show();
          } else if (state is SignUpOperationNotAllowed) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Sign Up Failed',
              desc: 'Operation not allowed',
              btnOkOnPress: () {
              },
              btnOkColor: Colors.red,
            ).show();
          } else if (state is SignUpWeakPassword) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.bottomSlide,
              title: 'Sign Up Failed',
              desc: 'Weak password',
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
                                "Sign Up".toUpperCase(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: defaultPadding / 2),
                            Row(
                              children: [
                                const Spacer(),
                                Expanded(
                                  flex: 8,
                                  child: SvgPicture.asset(
                                      "assets/icons/signup.svg"),
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
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                        controller: nameController,
                                        keyboardType: TextInputType.name,
                                        cursorColor: kPrimaryColorForm,
                                        decoration: const InputDecoration(
                                          hintText: "Your name",
                                          prefixIcon: Padding(
                                            padding:
                                                EdgeInsets.all(defaultPadding),
                                            child: Icon(Icons.person),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: defaultPadding),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
                                        controller: emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        cursorColor: kPrimaryColorForm,
                                        decoration: const InputDecoration(
                                          hintText: "Your email",
                                          prefixIcon: Padding(
                                            padding:
                                                EdgeInsets.all(defaultPadding),
                                            child: Icon(Icons.email),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: defaultPadding),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            return null;
                                          },
                                          controller: passwordController,
                                          obscureText: true,
                                          cursorColor: kPrimaryColorForm,
                                          decoration: const InputDecoration(
                                            hintText: "Your password",
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(
                                                  defaultPadding),
                                              child: Icon(Icons.lock),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: defaultPadding),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!=passwordController.text) {
                                              return 'Password not match';
                                            }else if (value!.isEmpty) {
                                              return 'Please enter your password';
                                            }
                                            return null;
                                          },
                                          controller: confirmPasswordController,
                                          obscureText: true,
                                          cursorColor: kPrimaryColorForm,
                                          decoration: const InputDecoration(
                                            hintText: "Confirm password",
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(
                                                  defaultPadding),
                                              child: Icon(Icons.lock),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                          height: defaultPadding / 2),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 5,
                                          backgroundColor: kPrimaryColorForm,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (formKey.currentState!.validate()) {
                                            isLoading = true;
                                            setState(() {});
                                            try {
                                            await context.read<SignUpCubit>().signUp(
                                                    email: emailController.text
                                                        .trim(),
                                                    password: passwordController
                                                        .text
                                                        .trim(),
                                                    name: nameController.text
                                                        .trim(),
                                                  );

                                            }  catch (e) {
                                              print(e);
                                            }
                                            isLoading = false;
                                            setState(() {});
                                          }
                                        },
                                        child: Text("Sign Up".toUpperCase()),
                                      ),
                                      const SizedBox(height: defaultPadding),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Already have an Account ? ",
                                            style:
                                                TextStyle(color: kPrimaryColorForm),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, LoginPage.id);
                                            },
                                            child: const Text(
                                              "SIGN IN",
                                              style: TextStyle(
                                                color: kPrimaryColorForm,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
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
String? id;
//   Future userRegister() async {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim());
//     await addUserDetails();
//   }
//
//   Future addUserDetails() async {
//     DocumentReference newDoc =
//         await FirebaseFirestore.instance.collection('users').add({
//       'name': nameController.text.trim(),
//       'email': emailController.text.trim(),
//       'password': passwordController.text.trim(),
//       'Revenue': 0,
//     });
//     newDocID = newDoc.id;
//   }
// }
//


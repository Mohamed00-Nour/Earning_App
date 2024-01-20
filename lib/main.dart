import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Cubits/AccountDeleteCubit/account_deletion_cubit.dart';
import 'package:flutter_auth/Cubits/GetDataByUserEmailCubit/get_data_by_user_email_cubit.dart';
import 'package:flutter_auth/Cubits/scratch/scratch_cubit.dart';
import 'package:flutter_auth/Cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter_auth/Cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:flutter_auth/Cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter_auth/Pages/ProfilePage/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'Cubits/CountDownCubit/count_down_cubit.dart';
import 'Cubits/TaskCompletionCubit/task_completion_cubit.dart';
import 'Cubits/forget_password_cubit/forget_password_cubit.dart';
import 'Cubits/spin_cubit/spin_cubit.dart';
import 'Pages/Games Card/games_card_page.dart';
import 'Pages/Gnav.dart';
import 'Pages/Home Page/home_page.dart';
import 'Pages/Hot Now Page/hot_now_page.dart';
import 'Pages/Login_Page.dart';
import 'Pages/ScrachCardPage/scretch_card_page.dart';
import 'Pages/Sign_Up_Page.dart';
import 'Pages/Spin Page/spin_page.dart';
import 'Pages/Visit Card/visit_card_page.dart';
import 'Pages/VisitingURL/test_url.dart';
import 'Pages/Watch Videos Card/watch_videos_page.dart';
import 'Pages/Web/visit_web_view.dart';
import 'Pages/forgot_password.dart';
import 'Pages/test_count_down.dart';
import 'Pages/togo.dart';
import 'Refer Task/refer_task.dart';
import 'Widgets/test/test1.dart';
import 'Widgets/test/test2.dart';
import 'Widgets/test/test3.dart';
import 'Widgets/test/test4.dart';
import 'constants.dart';
import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await Hive.initFlutter();
  runApp(const MyCashApp());
}

class MyCashApp extends StatelessWidget {
  const MyCashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<SignUpCubit>(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        ),
        BlocProvider<TaskCompletionCubit>(
          create: (context) => TaskCompletionCubit(),
        ),
        BlocProvider<SpinCubit>(
          create: (context) => SpinCubit(),
        ),
        BlocProvider<GetDataByUserEmailCubit>(
          create: (context) => GetDataByUserEmailCubit(),
        ),
        BlocProvider<ForgetPasswordCubit>(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider<SignOutCubit>(
          create: (context) => SignOutCubit(),
        ),
        BlocProvider<AccountDeletionCubit>(
          create: (context) => AccountDeletionCubit(),
        ),
      ],
      child: MaterialApp(

        routes: {
          SignUpPage.id: (context) =>   const SignUpPage(),
          LoginPage.id: (context) =>  const LoginPage(),
          GNavPage.id: (context) =>  const GNavPage(),
          BalanceWidget.id: (context) =>   const BalanceWidget(),
          ForgotPassword.id: (context) =>   const ForgotPassword(),
          VisitPage.id: (context) =>   const VisitPage(),
          SpinPage.id: (context) =>   const SpinPage(),
          HomePage.id: (context) =>    HomePage(email: ''),
          ScratchCardPage.id: (context) =>   const ScratchCardPage(),
          WatchVideosCard.id: (context) =>   const WatchVideosCard(),
          HotNow.id: (context) =>   const HotNow(),
          ProfilePage.id : (context)=> const ProfilePage(email: ''),
          Test1.id : (context)=>  Test1(),
          Test2.id : (context)=>  Test2(),
          Test3.id : (context)=>  Test3(),
          GamesPage.id : (context)=>  const GamesPage(),
          ReferTask.id : (context)=>  const ReferTask(),
          TestUrl.id : (context)=>  const TestUrl(),
          VisitWebView.id : (context)=>  const VisitWebView(),
        },
        theme: ThemeData(
            primaryColor: kPrimaryColorForm,
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: kPrimaryColorForm,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColorForm,
              iconColor: kPrimaryColorForm,
              prefixIconColor: kPrimaryColorForm,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            ),),
        debugShowCheckedModeBanner: false,

        home:LoginPage(),
      ),
    );
  }
}

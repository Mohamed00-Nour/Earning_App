import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Cubits/TaskCompletionCubit/task_completion_cubit.dart';
import '../../constants.dart';

class VisitWebView extends StatefulWidget {
  const VisitWebView({Key? key,  }) : super(key: key);

  static const String id = 'VisitWebView';

  @override
  _VisitWebViewState createState() => _VisitWebViewState();
}

class _VisitWebViewState extends State<VisitWebView> {
  late WebViewController _controller;
  String _currentUrl = '';
  bool webViewVisible = true;
  bool showCustomButton = false;
  int countdown = 20;
  Timer? countdownTimer;
  bool loadError = false; // Add this line

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final email = args['email'];
    final initialUrl = args['initialUrl'];
    final destinationUrl = args['destinationUrl'];
    final taskCompletionCubit = BlocProvider.of<TaskCompletionCubit>(context);
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false;
        } else if (_currentUrl == initialUrl) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            headerAnimationLoop: false,
            animType: AnimType.bottomSlide,
            title: 'Warning',
            desc: 'You really want to exit? You won\'t take any rewards!',
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              Navigator.of(context).pop();
            },
          ).show();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),
            Visibility(
              visible: webViewVisible && !loadError, // Check loadError here
              child: Expanded(
                child: WebView(
                  initialUrl: initialUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller = webViewController;
                  },
                  onWebResourceError: (error) {
                    setState(() {
                      loadError = true; // Set loadError to true when an error occurs
                    });
                  },
                  onPageFinished: (String url) {
                    if (loadError) { // Check loadError here
                      return;
                    }
                    setState(() {
                      _currentUrl = url;
                      if (_currentUrl == destinationUrl) {
                        countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
                          setState(() {
                            if (countdown > 0) {
                              countdown--;
                            } else {
                              timer.cancel();
                              showCustomButton = true;
                              countdown = 20;
                            }
                          });
                        });
                      } else {
                        showCustomButton = false;
                      }
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: !showCustomButton,
              child: Text(
                'Reward Button will be displayed in $countdown seconds',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Visibility(
              visible: showCustomButton,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.bottomSlide,
                      title: 'Task Completed',
                      desc: 'You have earned 5 points',
                      btnOkOnPress: () {
                        taskCompletionCubit.completeTask(email! , 5);
                        Navigator.pop(context);
                      },
                      dismissOnTouchOutside: false,
                      dismissOnBackKeyPress: false,
                    ).show();
                  },
                  child: const Text('Get your Reward'),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
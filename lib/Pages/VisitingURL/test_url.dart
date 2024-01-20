import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class TestUrl extends StatefulWidget {
  const TestUrl({super.key});

  static const String id = 'TestUrl';

  @override
  State<TestUrl> createState() => _TestUrlState();
}

class _TestUrlState extends State<TestUrl> {
  late WebViewController _controller;
  String _currentUrl = '';
  String _initialUrl = 'https://creators.nafezly.com/u/mohamednour/best-ps4-emulator-for-android'; // Set the initial URL
  bool webViewVisible = false;
  bool showCustomButton = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () { // Handle the back button
        if (webViewVisible) {
          _controller.goBack();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView Example'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  webViewVisible = true;
                });
              },
              child: const Text('Load WebView'),
            ),
            Visibility(
              visible: webViewVisible,
              child: Expanded(
                child: Column(
                  children: [
                     WebView(
                       initialUrl: _initialUrl,
                       javascriptMode: JavascriptMode.unrestricted,
                       onWebViewCreated: (
                           WebViewController webViewController) {
                         _controller = webViewController;
                       },
                       onPageFinished: (String url) {
                         setState(() {
                           _currentUrl = url;
                           // Check if the current URL is the target URL
                           if (_currentUrl ==
                               'https://creators.nafezly.com/u/mohamednour/best-ps4-emulator-for-android') {
                             showCustomButton = true;
                           } else {
                             showCustomButton = false;
                           }
                         });
                       },
                     ),
                    Visibility(
                      visible: showCustomButton,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: const Text('Custom Button'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('Current URL: $_currentUrl'),
          ],
        ),
      ),
    );
  }
}

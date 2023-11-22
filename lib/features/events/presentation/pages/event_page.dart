// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // controller = WebViewController()
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            controller
                // ..runJavaScript(
                //   "document.getElementsByTagName('header')[0].remove()",
                // )
                .runJavaScript(
              "document.getElementsByTagName('footer')[0].remove()",
            );
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://genshin.hoyoverse.com/en/news'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Genshin News'),
        // ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

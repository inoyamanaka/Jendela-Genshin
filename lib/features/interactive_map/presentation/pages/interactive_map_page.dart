import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InteractiveMapPage extends StatefulWidget {
  const InteractiveMapPage({super.key});

  @override
  State<InteractiveMapPage> createState() => _InteractiveMapPageState();
}

class _InteractiveMapPageState extends State<InteractiveMapPage> {
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
            controller
              ..runJavaScript(
                'document.getElementsByClassName("navbar-collapse-maps")[0].remove();',
              )
              ..runJavaScript(
                'document.getElementsByClassName("navbar-logo")[0].remove();',
              );
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://mapgenie.io/genshin-impact/maps/teyvat',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

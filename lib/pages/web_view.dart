import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController controller;
  int progress = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int p) {
            setState(() {
              progress = p; // update progress value
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              progress = 100; // done loading
            });
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://apnews.com/article/trump-dei-schools-lawsuit-ruling-education-department-4c1dbb5f7b3997ba78c17b25a935fb3f',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: progress < 100
              ? LinearProgressIndicator(
                  value: progress / 100, // 0.0 to 1.0
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                  minHeight: 3,
                )
              : const SizedBox.shrink(),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

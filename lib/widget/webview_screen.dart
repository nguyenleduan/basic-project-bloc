import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../core/utils/size_utils.dart';

class WebViewScreen extends StatefulWidget {
  String? path;
  String? pageName;
  bool? isBackShowButtonBar; // default = true

  WebViewScreen({Key? key, this.pageName, this.path,this.isBackShowButtonBar}) : super(key: key);

  _WebViewScreen createState() => _WebViewScreen();
}

class _WebViewScreen extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
    WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..runJavaScript(
          "document.getElementsByClassName('slds-grid slds-grid--align-spread slds-p-around--medium toptoolbar toolbar top forceContentContentDistributionViewerToolbar')[0].remove();")
      ..loadRequest(Uri.parse(widget.path!));
    _controller = controller;
  }
  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              widget.pageName?? "Website",
              style: TextStyle(
                  fontSize: getSize(18),
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )),
        body: Container(
            color: Colors.white, child: WebViewWidget(controller: _controller)
        ),
      ),
    );
  }
}
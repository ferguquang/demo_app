import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:workflow_manager/base/network/api_caller.dart';

class FlowChart extends StatefulWidget {
  String url;

  FlowChart(this.url);

  @override
  State<StatefulWidget> createState() {
    return _FlowChartState();
  }
}

class _FlowChartState extends State<FlowChart> {
  WebViewController _controller;
  bool isLoadingShowing = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }

    print("chart ${widget.url}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (isLoadingShowing) ApiCaller.instance.hideLoading();
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lưu đồ"),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _controller.clearCache();
                _controller?.reload();
              },
            )
          ],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
            _controller.clearCache();
            print("onWebViewCreated");
          },
          onPageStarted: (url) {
            print("onPageStarted: $url");
            ApiCaller.instance.showLoading();
            isLoadingShowing = true;
          },
          onPageFinished: (url) {
            print("onPageFinished: $url");
            ApiCaller.instance.hideLoading();
            isLoadingShowing = false;
          },
          onWebResourceError: (erro) {
            print(erro.description);
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          initialUrl: widget.url,
          gestureNavigationEnabled: true,
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}

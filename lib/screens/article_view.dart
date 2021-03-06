import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String postUrl;
  ArticleView({@required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
              child: Container(
          height: MediaQuery.of(context).size.height,
          // height: MediaQuery.of(context).size.height*0.83,
          width: MediaQuery.of(context).size.width ,
          child: WebView(
            
            initialUrl:  widget.postUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}

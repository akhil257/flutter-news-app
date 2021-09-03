import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {

  WebViewController _controller;

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/privacy.html');
    _controller.loadUrl( Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "BOL",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                  fontStyle: FontStyle.italic),
            ),
            Image.asset(
              'assets/flash.png',
              height: 25,
            ),
            Text(
              "  News       ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
              child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width ,
          child: WebView(
            
            initialUrl:  '',
            onWebViewCreated: (WebViewController webViewController){
              _controller=webViewController;
              _loadHtmlFromAssets();
            },
          ),
        ),
      ),
    );
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(News());
}

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "news",
      home: Home(),
    );
  }
}



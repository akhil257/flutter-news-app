import 'package:flutter/material.dart';

class About extends StatelessWidget {
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
      // drawer: Nav(),
      body: Center(
        child: Text("gk"),
      ),
    );
    // );
  }
}

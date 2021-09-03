import 'package:flutter/material.dart';
import 'package:news/helpers/responsive.dart';
import 'package:news/models/conditions.dart';
import 'package:news/screens/about.dart';
import 'package:news/screens/privacy_policy.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Nav extends StatelessWidget {

  final Conditions c;

  const Nav(
    this.c,
  );

  _launchURL() async {
  const url = 'https://play.google.com/store/apps/details?id=com.techmonks.bolt';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("launch failed");
  }
}


  @override
  Widget build(BuildContext context) {
    print(c);
    num s=Responsive.h(22);
    return Drawer(
      elevation: 500,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          // width: 50,
          child: Column(
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.only(
                  bottom: 30,
                  left: 20,
                  right: 20,
                ),
                child: c == null
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Image.asset(
                                'assets/' + c.wIcon + '.png',
                                height: Responsive.h(100),
                              ),

                          
                              Text(
                                "  "+c.temp.toString()+"\u00b0",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: Responsive.h(54),
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            "${c.wDescription[0].toUpperCase()}${c.wDescription.substring(1)}",
                            style: TextStyle(
                              fontSize: s,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Feels Like ${c.feelsLike}\u00b0 C",
                            style: TextStyle(
                              fontSize: s,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Humidity ${c.humidity}%",
                            style: TextStyle(
                              fontSize: s,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Wind ${c.windSpeed}",
                                style: TextStyle(
                                  fontSize: s,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Text(
                                "m/sec ",
                                style: TextStyle(
                                  fontSize: Responsive.h(18),
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Image.asset(
                                'assets/w.png',
                                height: Responsive.h(18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                (c.place + ", " + c.state + " ").length <= 17
                                    ? c.place + ", " + c.state + " "
                                    : c.place + " ",
                                style: TextStyle(
                                  fontSize: Responsive.h(20),
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Icon(
                                Icons.location_on,
                                size: Responsive.h(16),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 1.0,
                color: Colors.grey[100],
              ),
              ListTile(
                contentPadding: EdgeInsets.only(top: 7, left: 18),
                leading: Image.asset(
                  'assets/popular.png',
                  height: Responsive.w(25),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                title: Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: Responsive.w(20),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 1.0,
                color: Colors.grey[100],
              ),
              ListTile(
                contentPadding: EdgeInsets.only(top: 7, left: 18),
                onTap: () {
                  Share.share('Hey! Checkout this new app for relevant and unbiased news. Bolt News - Top Headlines, Weather and Market \nhttps://play.google.com/store/apps/details?id=com.techmonks.bolt',
                      subject: 'Bolt News');
                },
                leading: Image.asset(
                  'assets/share.png',
                  height: Responsive.w(25),
                ),
                title: Text(
                  'Share',
                  style: TextStyle(
                    fontSize: Responsive.w(20),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 1.0,
                color: Colors.grey[100],
              ),
              ListTile(
                onTap: _launchURL,
                contentPadding: EdgeInsets.only(top: 7, left: 18),
                // onTap: () {
                //   Share.share('check out my website https://example.com',
                //       subject: 'Look what I made!');
                // },
                leading: Icon(Icons.star_half,color: Colors.amber,size: Responsive.w(25),),
                title: Text(
                  'Rate us',
                  style: TextStyle(
                    fontSize: Responsive.w(20),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 1.0,
                color: Colors.grey[100],
              ),
              
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Privacy()));
                },
                contentPadding: EdgeInsets.only(top: 7, left: 18),
                leading: Image.asset(
                  'assets/policy.png',
                  height: Responsive.w(25),
                ),
                title: Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: Responsive.w(20),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                height: 1.0,
                color: Colors.grey[100],
              ),
              ListTile(
               
                contentPadding: EdgeInsets.only(top: 7, left: 18),
                leading: Icon(
                  Icons.help,
                  color: Colors.cyan,
                  size: Responsive.w(25),
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    fontSize: Responsive.w(20),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

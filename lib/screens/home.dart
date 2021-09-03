import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/helpers/category_widget.dart';
import 'package:news/helpers/covid_request.dart';
import 'package:news/helpers/covid_widget.dart';
import 'package:news/helpers/news_widget.dart';
import 'package:news/helpers/responsive.dart';
import 'package:news/helpers/stock_request.dart';
import 'package:news/helpers/stock_widget.dart';
import 'package:news/helpers/weather_requests.dart';
import 'package:news/helpers/weather_widget.dart';
import 'package:news/models/conditions.dart';
import 'package:news/screens/nav.dart';
import '../helpers/news_request.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var newslist = [];
  bool conn;
  Conditions ca;

  void getNews() async {
    News news = News();
    await news.getNews();

    setState(() {
      newslist = news.news;
    });
    if (newslist != []) {
      getWeather();
    }
  }

  getWeather() async {
    Weather weather = Weather();
    Conditions c = await weather.getWeather();
    setState(() {
      ca = c;
    });
  }
  void getStock() async {
    Market stock = Market();
    await stock.getStock();
  }

  void refresh() async {
    Market stock = Market();
    await stock.getStock();
  }

  
  BannerAd _bannerAd;
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: "ca-app-pub-2439037428682860/1042451916",
      size: AdSize.banner,   
      listener: (MobileAdEvent event) {
        print("BannerAd event+++++++ $event");
        print(event.toString());
      },
    );
  }

 @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
  @override
  void initState() {
    print("+-+-+-");
    super.initState();
    getConnectionCheck();
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-2439037428682860~8920941939");
    _bannerAd = createBannerAd()..load()..show(anchorType: AnchorType.bottom);
  }

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "BO",
              style: TextStyle(
                  fontSize: Responsive.w(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 4,
                  fontStyle: FontStyle.italic),
            ),
            Image.asset(
              'assets/flash.png',
              height: 26,
            ),
            Text(
              "T  News     ",
              style: TextStyle(
                  fontSize: Responsive.w(18),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
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
      drawer: Nav(ca),
      body: conn == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : !conn
              ? Center(
                  child: Text('Device not connected to internet'),
                )
              : newslist.isEmpty
                  ? Center(
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text('Loading News....'),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: getConnectionCheck,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              WeatherWidget(),
                              MainnewsWidget(newslist[0]),
                              Categories(),
                              SecnewsWidget(newslist[1]),
                              StockWidget(),
                              ...newslist.sublist(2).map((data) {
                                return SecnewsWidget(data);
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
    );
  }

  Future<void> getConnectionCheck() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        try {
          final result = await InternetAddress.lookup('examle.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
            // setState(() {
            //   conn = true;
            // });
            conn = true;
            getNews();
          } else {
            conn = false;
            print('inactive connection');
          }
        } on SocketException catch (_) {
          conn = false;
          print('lookup failed');
        }
      } else {
        conn = false;
        print('no connectivity found');
      }
    } catch (e) {
      conn = false;
      print('platform exception');
    }
  }
}

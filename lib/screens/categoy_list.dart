import 'package:flutter/material.dart';
import 'package:news/helpers/category_widget.dart';
import 'package:news/helpers/news_request.dart';
import 'package:news/helpers/news_widget.dart';
import 'package:news/helpers/responsive.dart';

class CategoryList extends StatefulWidget {
  final String category;
  CategoryList({@required this.category});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var newslist = [];

  @override
  void initState() {
    print("+-+-+-");
    print('llllllllllllll');
    super.initState();
    getNews();
    // if (conn == true) {
    //   getNews();
    // }
  }

  Future<void> getNews() async {
    News news = News();
    await news.getCategoryNews(widget.category.toLowerCase());

    setState(() {
      newslist = news.news;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: newslist.isEmpty
          ? Center(
              child: CircularProgressIndicator(

              ),
            )
          : RefreshIndicator(
            onRefresh: getNews,
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Categories(),
                      MainnewsWidget(newslist[0]),
                      ...newslist.sublist(1).map((data) {
                        return SecnewsWidget(data);
                      }).toList(),
                    ],
                  ),
                ),
              ),
          ),
    );
  }
}

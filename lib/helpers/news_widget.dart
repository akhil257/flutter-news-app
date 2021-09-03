import 'package:flutter/material.dart';
import 'package:news/helpers/responsive.dart';
import 'package:news/models/article.dart';
import 'package:news/screens/article_view.dart';

class MainnewsWidget extends StatelessWidget {

  const MainnewsWidget(
    this.newslist,
  );

  final Article newslist;

  @override
  Widget build(BuildContext context) {
    bool b=Responsive.b;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: newslist.articleUrl,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Responsive.w(8), vertical: Responsive.w(5)),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black12,
              width: 1,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.network(
                  newslist.urlToImage,
                  height: Responsive.w(190),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: <Widget>[
                  Text(
                    newslist.title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: b?20:16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    newslist.description,
                    maxLines: 3,
                    style: TextStyle(color: Colors.black54, fontSize: b?14:12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecnewsWidget extends StatelessWidget {
  const SecnewsWidget(
    this.newslist,
  );

  final Article newslist;

  @override
  Widget build(BuildContext context) {
    bool b=Responsive.b;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: newslist.articleUrl,
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Responsive.w(8), vertical: Responsive.w(5)),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black12,
              width: 1,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                child: Image.network(
                  newslist.urlToImage,
                  height: 145,
                  width: Responsive.w(138),
                  fit: BoxFit.cover,
                  
                )),
            Container(
              // constraints: BoxConstraints(maxHeight: Responsive.w(145)),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              width: Responsive.w(232),
              // height: Responsive.w(145),
              child: Column(
                children: <Widget>[
                  Text(
                    newslist.title,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: b?18:15,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    newslist.description,
                                        overflow: TextOverflow.ellipsis,

                    maxLines: 4,
                    style: TextStyle(color: Colors.black54, fontSize: b?13:12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

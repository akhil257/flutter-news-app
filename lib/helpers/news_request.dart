import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/article.dart';
import 'constants.dart' as Constants;

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?country=in&sortBy=publishedAt&language=en&pageSize=90";

    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: Constants.NEWSAPI_ID
    });

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            source: element['source']['name'],
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    } else
      print(jsonData['code']);
  }

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&sortBy=publishedAt&language=en&pageSize=90";

    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: Constants.NEWSAPI_ID
    });

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            source: element['source']['name'],
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    } else {
      print(jsonData['code']);
    }
  }
}

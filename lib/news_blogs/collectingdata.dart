import 'package:dio/dio.dart';
import 'dart:convert';

import 'article_model.dart';

String url =
    "https://newsapi.org/v2/top-headlines?country=us&apiKey=4007062bf13e48a1aac4279e8f4c4357";

class News {
  int i = 0;

  List<ArticleModel> news = [];

  Future<void> getNews() async {
    try {
      var response = await Dio().get(url);
      Map<String, dynamic> data = jsonDecode(response.toString());
      for (i = 0; i < data["articles"].length; i++) {
        String s = data["articles"][i]["url"].toString();
        if (s != "https://removed.com") {
          ArticleModel articleModel = ArticleModel(
              title: data["articles"][i]["title"].toString(),
              description: data["articles"][i]["description"].toString(),
              urlToImage: data["articles"][i]["urlToImage"].toString(),
              url: data["articles"][i]["url"].toString(),
              date: data["articles"][i]["publishedAt"]
                  .toString()
                  .substring(0, 10),
              author: data["articles"][i]["source"]["name"].toString());
          news.add(articleModel);
          print(data["articles"][i]["source"]["name"].toString());
        }
      }
    } catch (e) {}
  }
}
// articles[1].source.id

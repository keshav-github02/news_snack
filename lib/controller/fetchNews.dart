//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=dcd3a503e51e46ba9be1537b1f0801cc
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:news_snack/model/newsArt.dart';





class FetchNews{
  static List sourcesId = [
    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];


  static fetchNews() async{
    final _random=new Random();
    var sourceID=sourcesId[_random.nextInt(sourcesId.length)];

    print(sourceID);

    Response response =await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=dcd3a503e51e46ba9be1537b1f0801cc"));
    Map body_data=jsonDecode(response.body);
    List articles=body_data["articles"];
   // print(articles);
    print("*********************************************************");
    final _Newrandom=new Random();
    var myArticle=articles[_random.nextInt(articles.length)];
    print(myArticle);
    print("*********************************************************");
    NewsArt.fromAPItoApp(myArticle);
    //print(body_data);
  }
}
import 'package:flutter/material.dart';
import 'package:news_snack/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;

  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsDes,
      required this.newsCnt,
      required this.newsHead,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 264,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder:
                 "assets/img/breaking-news-concept_23-2148514216.jpg" ,
              image: imgUrl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  newsHead.length > 90
                      ? "${newsHead.substring(0, 90)}..."
                      : newsHead,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  newsDes,
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  newsCnt != "--"
                      ? newsCnt.length > 250
                          ? newsCnt.substring(0, 250)
                          : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                      : newsCnt,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailViewScreen(newsUrl: newsUrl)));
                    },
                    child: Text("Read More")),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

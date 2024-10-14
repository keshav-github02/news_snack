import 'package:flutter/material.dart';
import 'package:news_snack/controller/fetchNews.dart';
import 'package:news_snack/view/widget/NewsContainer.dart';

import '../model/newsArt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading=true;

  late NewsArt newsArt;

  GetNews() async{
    newsArt= await FetchNews.fetchNews();
    setState(() {
      isLoading=false;
    });
  }
  @override
  void initState() {
    GetNews();
    super.initState();
    // Fetch news asynchronously

  }

  // Function to fetch news

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 3),
          scrollDirection: Axis.vertical,
          onPageChanged: (value){
            setState(() {
              isLoading=true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {

            return isLoading?Center(child: CircularProgressIndicator(),): NewsContainer(
                imgUrl:
                    newsArt.imgUrl,
                newsCnt:
                   newsArt.newsCnt,
                newsHead: newsArt.newsHead,
                newsDes: newsArt.newsDes,
                newsUrl:newsArt.newsUrl);
          }),
    );
  }
}

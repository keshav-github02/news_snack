import 'package:flutter/material.dart';
import 'package:news_snack/controller/fetchNews.dart';
import 'package:news_snack/view/widget/NewsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch news asynchronously
    fetchNewsData();
  }

  // Function to fetch news
  void fetchNewsData() async {
    await FetchNews.fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 3),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            FetchNews.fetchNews();
            return NewsContainer(
                imgUrl:
                    "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202409/rohit-sharma-131403799-16x9.jpg?VersionId=BfxSCr8pLyofBhe2M.3dJtqzr53Tr.W2&size=690:388",
                newsCnt:
                    "Rohit Sharma is an Indian cricketer known for his elegant batting style and remarkable ability to score big runs in limited-overs formats. Born on April 30, 1987, in Nagpur, Maharashtra, Rohit has established himself as one of the most successful openers in the history of Indian cricket. He holds the record for the highest individual score in a One Day International (ODI), an incredible 264 runs, and is the only player to have scored three double centuries in ODIs. Sharma is also the captain of the Mumbai Indians in the Indian Premier League (IPL), leading them to multiple championships. Known for his calm demeanor and sharp cricketing mind, Rohit became the captain of the Indian national team in all formats, continuing his legacy as one of modern cricket’s finest players",
                newsHead: "Rohit Sharma",
                newsDes: "Recently he won most awaited t20 worldcup for our country",
                newsUrl: "https://en.wikipedia.org/wiki/Rohit_Sharma");
          }),
    );
  }
}

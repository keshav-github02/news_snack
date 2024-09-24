import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;


   NewsContainer({super.key,
     required this.imgUrl,
     required this.newsDes,
     required this.newsCnt,
     required this.newsHead,
     required this.newsUrl
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image.network(
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imgUrl),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(newsHead,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height:10,),
                Text(newsDes,style: TextStyle(fontSize: 12,color: Colors.black38),),
                SizedBox(height:10,),
                Text(newsCnt,style: TextStyle(fontSize: 16),),
              ],
            ),
          ),


          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(onPressed: (){
                  print("Goingto $newsUrl");
                }, child: Text("Read More")),
              ),
            ],
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}

import 'package:bloc_wall_street_news/controllers/newsBloc.dart';
import 'package:bloc_wall_street_news/controllers/news_api_controller.dart';
import 'package:flutter/material.dart';

import '../models/NewsModel_B.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final newsBloc = NewsBloc();
  NewsApiController newsApiController = NewsApiController();

  @override
  void initState() {
    newsBloc.eventSink.add(newsAction.newsFetch);
    NewsApiController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: Container(
            child: StreamBuilder<List<Articles>?>(
      stream: newsBloc.newsStream,

      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data);
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var article = snapshot.data![index];
// if(article.publishedAt != null){
// var formattedTime = DateFormat('dd MMM - HH:mm')
// .format(article.publishedAt);
// }
                return Container(
                  height: 100,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              article.urlToImage ?? 'dsddb',
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
// Text(formattedTime),
                            Text(
                              article.title ?? 'title',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              article.description ?? 'description',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else
          return Center(child: CircularProgressIndicator());
      },
    )  )
            );


  }
}
// FutureBuilder(
// future: newsApiController.fetchLocationArea(),
// builder: (context, AsyncSnapshot<NewsModel?> snapshot) {
// if (!snapshot.hasData) {
// return SizedBox(
// height: MediaQuery.of(context).size.height,
// child: const Center(child: CircularProgressIndicator()),
// );
// } else {
// return ListView.builder(
// itemCount: snapshot.data!.articles!.length,
// itemBuilder: (context, index) {
// return Text(
// '${snapshot.data!.articles![index].author}');
// });
// }
// })));

//

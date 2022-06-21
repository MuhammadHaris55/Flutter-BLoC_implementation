import 'dart:async';
import 'dart:convert';

// import 'package:bloc_wall_street_news/models/newsModel.dart';
import 'package:bloc_wall_street_news/models/NewsModel_B.dart';
import 'package:http/http.dart' as http;

enum newsAction{
  newsFetch,
newsDelete
}
class NewsBloc {

  final _stateStreamController = StreamController<List<Articles>>();
  StreamSink<List<Articles>?> get _newsSink => _stateStreamController.sink;
  Stream<List<Articles>?> get newsStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<newsAction>();
  StreamSink<newsAction> get eventSink => _eventStreamController.sink;
  Stream<newsAction> get _eventStream => _eventStreamController.stream;

  NewsBloc() {

    _eventStream.listen((event) async {
      if(event == newsAction.newsFetch){
        // try {
          var news = await getNews();
          // (news.articles as List).forEach((element) {
          //   _newsSink.add(element);
          // });
          _newsSink.add(news.articles);
        // } on Exception catch (e) {
        //   _newsSink.addError('Something went wrong');
        // }
      }
    });
  }

  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    // try {
      var response = await client.get(Uri.parse('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=8b0cf2b33ae94b67bce1f1fb602aff4c'));
        var jsonString = response.body;
        print(response.body);
        var jsonMap = json.decode(jsonString);

      if (response.statusCode == 200) {
        return NewsModel.fromJson(jsonMap);
      }
    // } catch (Exception) {
    //   return newsModel;
    // }
    return NewsModel.fromJson(jsonMap);

  }
}
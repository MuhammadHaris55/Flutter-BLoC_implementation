import 'dart:convert';
import 'package:bloc_wall_street_news/models/newsModel.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(Uri.parse('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=8b0cf2b33ae94b67bce1f1fb602aff4c'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}

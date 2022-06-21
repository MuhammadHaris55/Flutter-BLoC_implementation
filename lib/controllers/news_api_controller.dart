
import 'dart:convert';

import 'package:http/http.dart'as http  ;
import 'package:bloc_wall_street_news/models/NewsModel_B.dart';

class NewsApiController {
  Future<NewsModel> fetchLocationArea() async {
    final response = await http.get(Uri.parse("http://newsapi.org/v2/everything?domains=wsj.com&apiKey=8b0cf2b33ae94b67bce1f1fb602aff4c"));

    print(response);
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      // print(data['data'][0]['areaName']);
      return NewsModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
// // To parse this JSON data, do
// //
// //     final newsModel = newsModelFromJson(jsonString);
//
import 'dart:convert';

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles> articles = [];

  NewsModel({this.status, this.totalResults, this.articles  = const []});

  NewsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    totalResults = json['totalResults'];
    // if(json['articles'] != null){
      articles = <Articles>[];
      (json['articles'] as List).forEach((element) {
        articles.add(Articles.fromJson(element));
      });
    // }
  }
}

class Articles {
  List<Source>? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({this.source, required this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

  Articles.fromJson(Map<String, dynamic> json){
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];

    if(json['source'] != null){
      source = <Source>[];
      json['source']?.map((x) => source!.add(Source.fromJson(x)));
      // (json['source'] as List).forEach((element) {
      //   source!.add(Source.fromJson(element));
      // });
    }

  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, String> json){
    id = json['id'];
    name = json['id'];
  }
}
//
// NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));
//
// String newsModelToJson(NewsModel data) => json.encode(data.toJson());
//
// class NewsModel {
//   NewsModel({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });
//
//   String status;
//   int totalResults;
//   List<Article> articles;
//
//   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
//     status: json["status"],
//     totalResults: json["totalResults"],
//     articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "totalResults": totalResults,
//     "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//   };
// }
//
// class Article {
//   Article({
//     required this.source,
//     required this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     required this.content,
//   });
//
//   Source source;
//   String author;
//   String title;
//   String description;
//   String url;
//   String urlToImage;
//   DateTime publishedAt;
//   String content;
//
//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//     source: Source.fromJson(json["source"]),
//     author: json["author"],
//     title: json["title"],
//     description: json["description"],
//     url: json["url"],
//     urlToImage: json["urlToImage"],
//     publishedAt: DateTime.parse(json["publishedAt"]),
//     content: json["content"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "source": source.toJson(),
//     "author": author,
//     "title": title,
//     "description": description,
//     "url": url,
//     "urlToImage": urlToImage,
//     "publishedAt": publishedAt.toIso8601String(),
//     "content": content,
//   };
// }
//
// class Source {
//   Source({
//     required this.id,
//     required this.name,
//   });
//
//   Id id;
//   Name name;
//
//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//     id: idValues!.map![json["id"]],
//     name: nameValues!.map![json["name"]],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": idValues.reverse[id],
//     "name": nameValues.reverse[name],
//   };
// }
//
// enum Id { THE_WALL_STREET_JOURNAL }
//
// final idValues = EnumValues({
//   "the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL
// });
//
// enum Name { THE_WALL_STREET_JOURNAL }
//
// final nameValues = EnumValues({
//   "The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
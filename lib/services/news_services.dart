
import 'package:dio/dio.dart';
import 'package:news_app_flutter/models/article_model.dart';

class NewsServices{

  final Dio dio;
  
  NewsServices({required this.dio});
  
  Future<List<ArticleModel>> getNews({required String category}) async{
    try {
      Response response =await dio.get("https://newsapi.org/v2/everything?q=$category&apiKey=c59cd835a7104fed82540263c2a166ec");
      Map<String,dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articlesList =[];
      for (var article in articles){
        ArticleModel articleModel = ArticleModel.json(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
     return [];
    }
  }
}
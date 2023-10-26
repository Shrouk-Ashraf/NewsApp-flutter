
class ArticleModel{

  final String? articleImg;
  final String? title;
  final String? description;
  final String? url;

  ArticleModel({required this.url,required this.articleImg, required this.title, required this.description});


  factory ArticleModel.json(json){
    return ArticleModel(
        articleImg: json["urlToImage"]??"" ,
        title: json["title"]??"", description: json["description"]??"",
        url: json["url"]??"");
  }
}
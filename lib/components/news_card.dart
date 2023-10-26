import 'package:flutter/material.dart';
import 'package:news_app_flutter/components/circular_indicator.dart';
import 'package:news_app_flutter/views/details_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/article_model.dart';


class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.article
  });
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return DetailsView(article: article,controller: WebViewController(),);
            }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(article.articleImg ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLR0uw5vGaFyZAEKskr8KKioOYvV4bzdLIHWk1QDvrzTZL4rgYv8V03ZfTTVuklFw7QBA&usqp=CAU"
                     ,height: 180,fit: BoxFit.cover,width: double.infinity,
                errorBuilder: (ctx, exception, stackTrace) {
                  return Container(child:Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLR0uw5vGaFyZAEKskr8KKioOYvV4bzdLIHWk1QDvrzTZL4rgYv8V03ZfTTVuklFw7QBA&usqp=CAU"
                  ,height: 180,fit: BoxFit.cover,width: double.infinity, ));},
                )
            ),
            Text(article.title!,style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
              maxLines: 2,),
            Text(article.description ??"",style: const TextStyle(
                fontSize: 15,
                color: Colors.grey
            ),
              maxLines: 2,)
          ],
        ),
      ),
    );
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/services/news_services.dart';

import '../models/article_model.dart';
import 'news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.articlesList
  });

  final List<ArticleModel> articlesList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
                    childCount: articlesList.length,
                    (context,index){
                      return NewsCard(article: articlesList[index],);
                    }
            ),
    );

  }
}
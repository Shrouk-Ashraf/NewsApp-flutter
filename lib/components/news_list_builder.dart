import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/components/news_listview.dart';
import 'package:news_app_flutter/services/news_services.dart';

import '../models/article_model.dart';
import 'circular_indicator.dart';

/*
This builder for getting the data from api as we can't get it from the
NewsList as we want if there is no data yet show circle indicator
otherwise show the news and we want the newslist to only show the news not the
circle indicator then this is a clean coding
*/



class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({Key? key,required this.category}) : super(key: key);

  final category;

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {

  var future;

  @override
  void initState() {
    future = NewsServices(dio: Dio()).getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsList(articlesList: snapshot.data!);
          }
          else if (snapshot.hasError) {
            return SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2,
              child: const Center(
                child: Text("OOPs something went wrong, try again later"),
              ),
            );
          }
          else {
            return CircularIndicator();
          }
        });
  }
}


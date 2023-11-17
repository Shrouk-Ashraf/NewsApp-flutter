import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/article_model.dart';
import 'package:news_app_flutter/components/webview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';



class DetailsView extends StatelessWidget {

  const DetailsView({super.key, required this.article, required this.controller});

  final WebViewController controller;
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          body:  SafeArea(
              child: WebController(controller: controller, article: article,)),

      );
  }
}

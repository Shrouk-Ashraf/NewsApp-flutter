

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'circular_indicator.dart';
import '../models/article_model.dart';

class WebController extends StatefulWidget {
  const WebController({Key? key,required this.article,required this.controller}) : super(key: key);

  final ArticleModel article;
  final WebViewController controller ;
  @override
  State<WebController> createState() => _WebControllerState();
}

class _WebControllerState extends State<WebController> {

  bool isLoading = true;
  bool isError= false;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
            });
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            isError = true;
            throw Exception(error.description);
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse(widget.article.url!)
      );
  }


  @override
  Widget build(BuildContext context) {
    return isLoading?
      const Center(
        child: CircularProgressIndicator(),)
    :isError? const Center(child: Text("OOPs there is an error try again later")) : WebViewWidget(controller:  widget.controller,);
  }
}





/*
class WebController{
  WebController({required this.article});

  final ArticleModel article;
  WebViewController controller = WebViewController();

  WebViewController setController(){
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          },
          onWebResourceError: (WebResourceError error) {
            print ("ERROR");
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(article.url!));

    return controller;
  }


}*/

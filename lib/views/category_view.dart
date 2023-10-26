import 'package:flutter/material.dart';
import 'package:news_app_flutter/components/news_list_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key,required this.category}) : super(key: key);
  final category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              NewsListBuilder(category: category,)
            ],
          ),
        ),
      )
    );
  }
}

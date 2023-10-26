import 'package:flutter/material.dart';
import 'package:news_app_flutter/components/category_listview.dart';
import 'package:news_app_flutter/components/news_list_builder.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("News",style: TextStyle(
              color: Colors.black
            ),),
            Text("Cloud",style: TextStyle(
                color: Colors.orangeAccent
            ),)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoryListView(),),
            SliverToBoxAdapter(child: SizedBox(height: 20,),),
            NewsListBuilder(category: "gaza",)
          ],
        ),
      )
    );
  }
}





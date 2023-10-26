import 'package:flutter/material.dart';
import 'package:news_app_flutter/views/category_view.dart';

import '../models/category_model.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CategoryView(category: category.categoryName,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: 90,
          width: 130,
          decoration: BoxDecoration(
              image:  DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(category.image)
              ),
              borderRadius: BorderRadius.circular(6)
          ),
          child:  Center(
            child: Text(category.categoryName,style:  TextStyle(
                color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                  blurRadius: 0,
                ),
              ],
            ),),
          ),
        ),
      ),
    );
  }
}

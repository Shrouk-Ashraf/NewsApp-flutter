
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

List<CategoryModel> categories =[
  CategoryModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtw0NW_FzbA6qebLBbJ25ljH7PqfmjsnwXgQ&usqp=CAU",
      categoryName: "Sports"),
  CategoryModel(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRONmw4Si-yXmUidZUjpPfmOv0ap-R_bAxKCfT78NnL&s",
      categoryName: "Food"),
  CategoryModel(image:"https://media.istockphoto.com/id/1465188429/photo/business-performance-monitoring-concept-businessman-using-smartphone-online-survey-filling.webp?b=1&s=170667a&w=0&k=20&c=QJ2XWQVsbaB3Rzjk8tXv1csVlvyDvtww1NXK8yHzNl0=",
      categoryName: "Business"),
  CategoryModel(image: "https://static.vecteezy.com/system/resources/thumbnails/022/006/618/small/science-background-illustration-scientific-design-flasks-glass-and-chemistry-physics-elements-generative-ai-photo.jpeg",
      categoryName: "Science"),
  CategoryModel(image: "https://www.imf.org/-/media/Images/IMF/FANDD/article-image/2020/June/frieden-1600.ashx",
      categoryName: "Politics"),
];

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context,index){
          return CategoryCard(category: categories[index],);
        },),
    );
  }
}

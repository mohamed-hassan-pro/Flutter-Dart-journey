import 'package:_05_news_app/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = CategoryModel.categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CategoryCard(category: categories[index]),
        ),
      ),
    );
  }
}

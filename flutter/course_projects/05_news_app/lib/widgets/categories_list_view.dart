import 'package:_05_news_app/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.avif', category: 'business'),
    CategoryModel(image: 'assets/entertaiment.avif', category: 'entertainment'),
    CategoryModel(image: 'assets/general.avif', category: 'general'),
    CategoryModel(image: 'assets/health.avif', category: 'health'),
    CategoryModel(image: 'assets/science.avif', category: 'science'),
    CategoryModel(image: 'assets/sports.avif', category: 'sports'),
    CategoryModel(image: 'assets/technology.jpeg', category: 'technology'),
  ];

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

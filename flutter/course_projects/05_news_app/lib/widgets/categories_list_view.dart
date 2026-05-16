import 'package:_05_news_app/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.avif', categoryName: 'business'),
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'entertainment',
    ),
    CategoryModel(image: 'assets/general.avif', categoryName: 'general'),
    CategoryModel(image: 'assets/health.avif', categoryName: 'health'),
    CategoryModel(image: 'assets/science.avif', categoryName: 'science'),
    CategoryModel(image: 'assets/sports.avif', categoryName: 'sports'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'technology'),
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

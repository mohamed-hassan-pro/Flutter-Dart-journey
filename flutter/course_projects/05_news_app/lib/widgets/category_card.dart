import 'package:_05_news_app/models/categories_model.dart';
import 'package:flutter/material.dart';

import '../views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryView(category: category.name),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(category.image).image,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 250,
        child: Center(
          child: Text(
            category.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

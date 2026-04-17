import 'package:flutter/material.dart';
import 'package:language_learning_app/data/items_data.dart';
import 'package:language_learning_app/models/category_model.dart';
import 'package:language_learning_app/views/items_view.dart';

class CategoryData {
  static List<CategoryModel> categories(BuildContext context) {
    return [
      CategoryModel(
        txt: 'Numbers',
        bgColor: Colors.orange,
        items: Data.numbers,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: CategoryModel(
                txt: 'Numbers',
                bgColor: Colors.orange,
                items: Data.numbers,
              ),
            ),
          ),
        ),
      ),
      CategoryModel(
        txt: 'Family Members',
        bgColor: Colors.green,
        items: Data.familyMembers,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: CategoryModel(
                txt: 'Family Members',
                bgColor: Colors.green,
                items: Data.familyMembers,
              ),
            ),
          ),
        ),
      ),
      CategoryModel(
        txt: 'Colors',
        bgColor: Colors.purple,
        items: Data.colors,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: CategoryModel(
                txt: 'Colors',
                bgColor: Colors.purple,
                items: Data.colors,
              ),
            ),
          ),
        ),
      ),
      CategoryModel(
        txt: 'Phrases',
        bgColor: Colors.blue,
        items: Data.phrases,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemsView(
              category: CategoryModel(
                txt: 'Phrases',
                bgColor: Colors.blue,
                items: Data.phrases,
              ),
            ),
          ),
        ),
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:language_learning_app/models/item_model.dart';

class CategoryModel {
  final String txt;
  final Color bgColor;
  final VoidCallback? onTap;
  final List<ItemModel> items;
  const CategoryModel({
    required this.txt,
    required this.bgColor,
    this.onTap,
    required this.items,
  });
}

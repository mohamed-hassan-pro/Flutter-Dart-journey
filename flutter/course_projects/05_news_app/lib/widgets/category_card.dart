import 'package:_05_news_app/models/categories_model.dart';
import 'package:flutter/material.dart';

import '../views/category_view.dart';

// 💡 هذه الـ Widget تمثل كارت القسم الواحد (مثل رياضة، أعمال، الخ).
class CategoryCard extends StatelessWidget {
  // 💡 نطلب هنا كائن (Object) القسم كاملاً كإلزام (required).
  // هذا يسمح بجعل الكارت ديناميكياً يعرض أي قسم نمرره له بدلاً من كارت ثابت.
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    // 💡 GestureDetector لالتقاط لمسات المستخدم (مثل النقر onTap).
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        // 💡 نستخدم Navigator للانتقال لشاشة الـ CategoryView.
        // ونمرر اسم القسم (category.name) للصفحة الجديدة لتستخدمه في الـ API.
        // Data Passing (تمرير البيانات من صفحة لأخرى) مهم جداً هنا.
        MaterialPageRoute(
          builder: (context) => CategoryView(categoryName: category.name),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          // 💡 نستخدم DecorationImage لوضع الصورة كخلفية للـ Container.
          image: DecorationImage(
            image: Image.asset(category.image).image,
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 250,
        child: Center(
          child: Text(
            category.name, // 💡 عرض اسم القسم الديناميكي
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

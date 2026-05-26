import 'package:_05_news_app/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

// 💡 هذه الـ Widget مسئولة عن عرض قائمة الأقسام العلوية بشكل أفقي.
class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  
  // 💡 قمنا بسحب الأقسام من الـ CategoryModel مباشرة بدلاً من كتابتها هنا.
  // هذا يجعل ملف الـ UI نظيفاً ويركز فقط على كيفية الرسم وليس على محتوى البيانات.
  final List<CategoryModel> categories = CategoryModel.categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // 💡 تحديد ارتفاع ثابت أمر ضروري لأن ListView الأفقية تحتاج مساحة محددة وإلا ستعطي خطأ (Unbounded Height).
      width: double.infinity,
      // 💡 استخدمنا ListView.builder لأنها أفضل في الـ Performance من الـ ListView العادية.
      // فهي تبني فقط العناصر الظاهرة على الشاشة، ولا تبني كل الأقسام في الذاكرة دفعة واحدة (Lazy Loading).
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // جعل التمرير أفقياً
        itemCount: categories.length,     // عدد العناصر بناءً على طول القائمة
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          // 💡 نمرر هنا كائن (Object) القسم بالكامل إلى بطاقة العرض.
          child: CategoryCard(category: categories[index]),
        ),
      ),
    );
  }
}

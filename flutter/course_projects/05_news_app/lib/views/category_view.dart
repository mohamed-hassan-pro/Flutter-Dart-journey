import 'package:flutter/material.dart';
import '../widgets/news_list_view_builder.dart';

// 💡 هذه الشاشة (CategoryView) تُعرض عندما يضغط المستخدم على أي قسم.
class CategoryView extends StatelessWidget {
  // نستقبل اسم القسم (category) كـ Required Parameter من الشاشة السابقة.
  // 💡 هذه الطريقة (Data Passing) تجعل هذه الشاشة قابلة لإعادة الاستخدام (Reusable) لأي قسم.
  const CategoryView({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('News', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              categoryName, // 💡 استخدمنا المتغير هنا ليكون العنوان ديناميكي يتغير حسب القسم
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        // 💡 نستخدم CustomScrollView لدمج عدة أجزاء قابلة للتمرير (Slivers) معاً في شاشة واحدة.
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 💡 نُمرر اسم القسم هنا أيضاً للـ Builder لكي يجلبه من الـ API عبر الـ Service.
            NewsListViewBuilder(categoryName: categoryName),
          ],
        ),
      ),
    );
  }
}

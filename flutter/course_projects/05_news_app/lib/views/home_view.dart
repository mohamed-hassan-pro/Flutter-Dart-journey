import 'package:flutter/material.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/news_list_view_builder.dart';

// 💡 الشاشة الرئيسية للتطبيق، تحتوي على الأقسام العلوية والأخبار العامة.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              'Cloud',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        // 💡 استخدام CustomScrollView يعتبر من أفضل الممارسات عندما يكون لديك Scroll عمودي
        // يحتوي بداخله على Scroll أفقي أو قوائم متعددة، فهو يدمجهم بـ Performance ممتاز.
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            // 💡 SliverToBoxAdapter يستخدم لتحويل الـ Widgets العادية (مثل ListView العادي أو SizedBox)
            // لكي يمكن وضعها داخل مصفوفة الـ slivers الخاصة بـ CustomScrollView.
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            // 💡 NewsListViewBuilder بطبيعته يُرجع Sliver (SliverList أو SliverFillRemaining)
            // لذا نضعه مباشرة بدون SliverToBoxAdapter.
            // ونمرر له 'general' كقسم افتراضي للشاشة الرئيسية.
            NewsListViewBuilder(categoryName: 'general'),
          ],
        ),
      ),
    );
  }
}

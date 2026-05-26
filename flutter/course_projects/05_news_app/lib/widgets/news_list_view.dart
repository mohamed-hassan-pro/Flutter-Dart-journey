import 'package:_05_news_app/widgets/news_tile.dart';
import 'package:flutter/material.dart';
import '../models/article_model.dart';

// 💡 هذه الـ Widget مسئولة فقط عن رسم (UI) قائمة الأخبار (SliverList).
// هي لا تعلم أي شيء عن كيفية جلب البيانات (مفصولة تماماً عن الـ API)، فقط تأخذ البيانات وترسمها.
class NewsListView extends StatelessWidget {
  // نستقبل قائمة الأخبار الجاهزة من الـ Builder.
  const NewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;
  
  @override
  Widget build(BuildContext context) {
    // 💡 نستخدم SliverList بدلاً من ListView العادية لأن هذه القائمة
    // ستكون جزءاً من CustomScrollView في الشاشة الرئيسية (تتطلب Slivers).
    return SliverList(
      // 💡 SliverChildBuilderDelegate تقوم بنفس وظيفة ListView.builder
      // فهي تبني العناصر فقط عند ظهورها على الشاشة لتوفير استهلاك الذاكرة (Lazy Loading).
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: NewsTile(article: articles[index]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../services/news_service.dart';
import 'news_list_view.dart';

// 💡 هذه الـ Widget مسئولة عن ربط الـ UI بالداتا القادمة من الإنترنت.
// تستقبل اسم القسم كمتغير لتمريره لـ API.
class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.categoryName});
  final String categoryName;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // 💡 قمنا بتعريف متغير future لتخزين الـ Request فيه مرة واحدة فقط في initState.
  // أفضل ممارسة (Best Practice): لو استدعينا API مباشرة داخل دالة build، سيتم عمل Request جديد مع كل إعادة رسم (Re-build).
  var future;

  @override
  void initState() {
    super.initState();
    // نمرر اسم القسم (widget.category) للدالة لكي تجلب أخبار هذا القسم تحديداً.
    future = NewsService().getTopHeadlines(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    // 💡 FutureBuilder: هي الـ Widget المثالية للتعامل مع الـ Futures وبناء الشاشة بناءً على حالتها.
    // وهي بديل ممتاز وأقصر للكود من الطريقة اليدوية (استخدام متغير isLoading).
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        // الحالة الأولى: النجاح ووصول البيانات
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        }
        // الحالة الثانية: حدوث خطأ (مثل عدم وجود إنترنت)
        else if (snapshot.hasError) {
          return SliverFillRemaining(
            fillOverscroll: false,
            child: Center(child: Text("Opps There was an error, try leter")),
          );
        }
        // الحالة الثالثة: قيد التحميل (Loading)
        else {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

// 💡 هذا الملف يُعتبر كمرجع تعليمي (Reference) للطريقة اليدوية في إدارة الحالة (Manual State Management).
// هذه الطريقة كنا نستخدمها قبل أن نتعلم الـ FutureBuilder الأسهل والأكثر اختصاراً للكود.

// import 'package:_05_news_app/models/article_model.dart';
// import 'package:_05_news_app/services/news_service.dart';
// import 'package:_05_news_app/widgets/news_list_view.dart';
// import 'package:flutter/material.dart';

// class NewsListViewBuilder extends StatefulWidget {
//   const NewsListViewBuilder({super.key});

//   @override
//   State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
// }

// class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
//   List<ArticleModel> articles = [];
//   // 💡 استخدمنا متغير بولين (bool) ليعمل كمفتاح للتحكم في ظهور أو اختفاء شاشة التحميل.
//   bool isLoading = true;
//   
//   @override
//   void initState() {
//     super.initState();
//     // 💡 نستدعي الـ API في initState لأنها تعمل مرة واحدة فقط عند بدء تشغيل الـ Widget.
//     getNews();
//   }

//   Future<void> getNews() async {
//     articles = await NewsService().getNews();
//     // 💡 بمجرد وصول البيانات، نغير حالة التحميل لـ false.
//     isLoading = false;
//     // 💡 الدالة setState() هي السر هنا: فهي تجبر الشاشة على إعادة الرسم (Re-build) لإظهار الداتا الجديدة.
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     // 💡 استخدمنا معامل الشرط الثلاثي (Ternary Operator: condition ? true : false) لتبديل الواجهة.
//     return isLoading
//         ? SliverFillRemaining(
//             hasScrollBody: false,
//             child: Center(child: CircularProgressIndicator()),
//           )
//         : articles.isNotEmpty
//         ? NewsListView(articles: articles)
//         : SliverFillRemaining(
//             fillOverscroll: false,
//             child: Center(child: Text("Opps There was an error, try leter")),
//           );
//   }
// }


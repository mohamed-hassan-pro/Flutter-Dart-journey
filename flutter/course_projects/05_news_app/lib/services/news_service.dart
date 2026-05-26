import 'package:_05_news_app/models/article_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  Dio dio = Dio();
  // 💡 [تعديل جديد - Naming Convention]
  // تم تغيير اسم الدالة من `getNews` إلى `getTopHeadlines`.
  // السبب: التسمية الجديدة أكثر احترافية ودقة (Descriptive Name)، لأنها تعبر بوضوح عن أن هذا الـ API 
  // يجلب العناوين الرئيسية (Top Headlines) وليس مجرد أخبار عامة، مما يسهل فهم الكود لأي مبرمج آخر يقرأه.
  Future<List<ArticleModel>> getTopHeadlines(String category) async {
    try {
      // 1. نقوم بإرسال طلب (Request) من نوع GET للسيرفر لنجلب البيانات.
      // نستخدم كلمة await لأن هذه العملية تأخذ وقتاً، ولا بد أن ننتظر حتى ينتهي الرد.
      Response<dynamic> resonse = await dio.get(
        'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=7bf5fef0a5e944bb838dd34a90646a87',
      );

      // 2. نقوم باستخراج البيانات (Data) من الرد، ونخزنها في Map لأن الـ JSON القادم من هذا الـ API عبارة عن Map.
      Map<String, dynamic> jsonData = resonse.data;

      // 3. داخل الـ Map، يوجد مفتاح اسمه 'articles' يحتوي على قائمة (List) الأخبار، فنقوم باستخراجه.
      List<dynamic> articles = jsonData['articles'];

      // 4. نُجهز قائمة فارغة من نوع ArticleModel لنضع فيها الأخبار بعد تحويلها لشكل منظم.
      List<ArticleModel> articlesList = [];

      // 5. نمر (Loop) على كل خبر (والذي هو عبارة عن Map عشوائي) داخل قائمة الـ articles الأصلية.
      for (var article in articles) {
        // 💡 [تعديل جديد - Clean Code & Separation of Concerns]
        // بدلاً من كتابة كود الـ Parsing (استخراج الصورة والاسم) يدوياً هنا وعمل زحمة في الـ Service،
        // أصبحنا نستدعي الـ Factory Constructor الجاهز `ArticleModel.fromJson`.
        // هذا جعل الكود أقصر، أنظف، وسهل القراءة، ومفصول المهام!
        articlesList.add(ArticleModel.fromJson(article));
      }

      // 7. أخيراً، نُرجع القائمة المنظمة والجاهزة للاستخدام في واجهة المستخدم (UI).
      return articlesList;
    } catch (e) {
      // 8. في حالة حدوث أي خطأ (مثل انقطاع الإنترنت)، نعيد قائمة فارغة بدلاً من أن يتوقف التطبيق (Crash).
      return [];
    }
  }
}

// 💡 هذا الملف يمثل نمذجة البيانات (Data Modeling)
// وظيفة الـ Model هي تحويل البيانات العشوائية التي نستقبلها من الـ API (والتي تكون بصيغة JSON/Map)
// إلى كائن منظم (Object) بخصائص محددة (Strongly Typed).
// هذا يمنع الأخطاء الإملائية ويجعل التعامل مع البيانات أسهل بكثير في باقي أجزاء التطبيق.

class ArticleModel {
  // تعريف خصائص الخبر (الصورة، العنوان، التفاصيل)
  // جعلناها final لأننا لا نخطط لتغيير بيانات الخبر بعد استلامه (Immutable).
  final String image;
  final String title;
  final String subTitle;

  // הـ Constructor يطلب هذه البيانات بشكل إجباري (required) عند إنشاء أي خبر جديد.
  const ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  // 💡 [تعديل جديد - Best Practice]
  // تم استخدام `factory fromJson` هنا لتطبيق مبدأ "المسؤولية الواحدة" (Single Responsibility Principle).
  // في الكود القديم، كانت طبقة الـ Service هي من تقوم بتحليل الـ JSON (Parsing).
  // التحديث الأفضل هندسياً (Clean Code) هو أن يكون الموديل (ArticleModel) هو المسئول الوحيد عن معرفة كيفية تحويل بيانات الـ JSON إلى كائن (Object).
  // استخدام كلمة `factory` يسمح لنا بإرجاع كائن جديد (Instance) من هذا الكلاس بكل سهولة بناءً على البيانات المُمررة له.
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      // نستخدم (??) لتوفير صورة/نص بديل في حالة كان الـ API يفتقد لهذه المعلومة (null).
      image:
          json['urlToImage'] ??
          'https://i.ytimg.com/vi/pgg4ou4gf7M/maxresdefault.jpg',
      title: json['title'] ?? 'No Title',
      subTitle: json['description'] ?? 'No SubTitle',
    );
  }
}

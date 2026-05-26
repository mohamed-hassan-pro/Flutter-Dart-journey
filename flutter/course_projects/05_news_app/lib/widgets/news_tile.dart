import 'package:_05_news_app/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// 💡 هذه الـ Widget تمثل بطاقة الخبر الواحد (صورة، عنوان رئيسي، عنوان فرعي).
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});
  // 💡 نطلب كائن (Object) الخبر كاملاً لكي نرسم الـ UI بناءً عليه.
  final ArticleModel article;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 💡 ClipRRect يُستخدم لقص حواف الصورة لجعلها دائرية.
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          // 💡 هنا استخدمنا Image.network العادية مع errorBuilder لتفادي انهيار التطبيق.
          // في حال أردنا أداء أفضل وحفظ للصور، نستخدم CachedNetworkImage (الموجودة في التعليقات بالأسفل).
          child: Image.network(
            article.image,
            fit: BoxFit.fill,
            height: 200,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                const Text('Image failed to load'),
          ),
          
          // 💡 مقارنة: CachedNetworkImage أفضل من Image.network لأنها:
          // 1. تحفظ الصورة في الذاكرة (Cache) لتوفير الإنترنت.
          // 2. توفر (placeholder) جميل أثناء التحميل.
          // 3. توفر (errorWidget) تلقائي إذا فشل التحميل.
          // CachedNetworkImage(
          //   imageUrl: article.image,
          //   fit: BoxFit.fill,
          //   height: 200,
          //   width: double.infinity,
          //   placeholder: (context, url) =>
          //       Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // ),
        ),
        SizedBox(height: 8),
        Text(
          article.title,
          maxLines: 2, // 💡 حد أقصى سطرين حتى لا يطول الكارت بشكل مبالغ فيه.
          overflow: TextOverflow.ellipsis, // وضع (...) إذا زاد النص عن السطرين.
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6),
        Text(
          article.subTitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}

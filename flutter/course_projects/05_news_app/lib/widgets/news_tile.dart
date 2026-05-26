import 'package:_05_news_app/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            article.image,
            fit: BoxFit.fill,
            height: 200,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                const Text('Image failed to load'),
          ),
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
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

import 'package:_05_news_app/widgets/news_tile.dart';
import 'package:flutter/material.dart';
import '../models/article_model.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
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

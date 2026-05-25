import 'package:_05_news_app/models/article_model.dart';
import 'package:_05_news_app/services/news_service.dart';
import 'package:flutter/material.dart';
import 'news_tile.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({super.key});

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  List<ArticleModel> articles = [];
  @override
  void initState() async {
    super.initState();
    articles = await NewsService().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: NewsTile(article: articles[index],),
        ),
      ),
    );
  }
}

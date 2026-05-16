import 'package:flutter/material.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 5,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: const NewsTile(),
        ),
      ),
    );
  }
}

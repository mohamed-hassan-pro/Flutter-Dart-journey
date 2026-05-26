import 'package:_05_news_app/models/article_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  Dio dio = Dio();
  Future<List<ArticleModel>> getNews() async {
    try {
      Response<dynamic> resonse = await dio.get(
        'https://newsapi.org/v2/top-headlines?category=general&country=us&apiKey=7bf5fef0a5e944bb838dd34a90646a87',
      );
      Map<String, dynamic> jsonData = resonse.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        articlesList.add(
          ArticleModel(
            image:
                article['urlToImage'] ??
                'https://i.ytimg.com/vi/pgg4ou4gf7M/maxresdefault.jpg',
            title: article['title'] ?? 'No Title',
            subTitle: article['description'] ?? 'No SubTitle',
          ),
        );
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}

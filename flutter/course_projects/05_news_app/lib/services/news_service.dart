import 'package:_05_news_app/models/article_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  //method for get news any category and return List<ArticleModel>
  Future<List<ArticleModel>> getNews(String category) async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=7bf5fef0a5e944bb838dd34a90646a87',
    );
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticleModel> articlesList = [];
    for (var article in articles) {
      ArticleModel articleModel = ArticleModel(
        image: article['urlToImage'],
        title: article['title'],
        subTitle: article['description'],
      );
      articlesList.add(articleModel);
    }
    return articlesList;
  }

}

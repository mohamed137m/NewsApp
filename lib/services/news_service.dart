import 'package:dio/dio.dart';
import 'package:news_app/Model/articles_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticlesModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=28887c8875964e2ebe501dc860119463',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      
      List<ArticlesModel> articlesList = [];
      for (var article in articles) {
        ArticlesModel articlesModel = ArticlesModel.fromJson(article);
        articlesList.add(articlesModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}

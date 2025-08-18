import 'package:flutter/foundation.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService newsService;

  NewsProvider(this.newsService);

  final Map<String, List<ArticlesModel>> _articlesByCategory = {};
  final Set<String> _loadingCategories = {};
  final Map<String, String> _errorByCategory = {};

  List<ArticlesModel> articlesFor(String category) {
    return _articlesByCategory[category] ?? <ArticlesModel>[];
  }

  bool isLoading(String category) {
    return _loadingCategories.contains(category);
  }

  String? errorFor(String category) {
    return _errorByCategory[category];
  }

  Future<void> loadCategory(String category) async {
    if (_articlesByCategory.containsKey(category)) {
      return;
    }
    _loadingCategories.add(category);
    _errorByCategory.remove(category);
    notifyListeners();
    try {
      final List<ArticlesModel> articles = await newsService.getNews(category: category);
      _articlesByCategory[category] = articles;
    } catch (e) {
      _errorByCategory[category] = 'Failed to load news';
    } finally {
      _loadingCategories.remove(category);
      notifyListeners();
    }
  }

  Future<void> refreshCategory(String category) async {
    _loadingCategories.add(category);
    _errorByCategory.remove(category);
    notifyListeners();
    try {
      final List<ArticlesModel> articles = await newsService.getNews(category: category);
      _articlesByCategory[category] = articles;
    } catch (e) {
      _errorByCategory[category] = 'Failed to load news';
    } finally {
      _loadingCategories.remove(category);
      notifyListeners();
    }
  }
}



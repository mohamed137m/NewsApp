import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widget/custom_news_list_view.dart';

class NewsListViewWidget extends StatefulWidget {
  const NewsListViewWidget({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewWidget> createState() => _NewsListViewWidgetState();
}

class _NewsListViewWidgetState extends State<NewsListViewWidget> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlesModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomNewsListView(articles: snapshot.data ?? []);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text('oops there was an error, try latter'),
          );
        } else {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
            ),
          );
        }
      },
    );
  }
}

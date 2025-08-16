import 'package:flutter/material.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/widget/custom_news_tile.dart';

class CustomNewsListView extends StatelessWidget {
  const CustomNewsListView({super.key, required this.articles});
  final List<ArticlesModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articles.length, (
        context,
        index,
      ) {
        return CustomNewsTile(articlesModel: articles[index]);
      }),
    );
  }
}

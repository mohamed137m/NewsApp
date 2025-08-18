import 'package:flutter/material.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/widget/custom_news_list_view.dart';
import 'package:provider/provider.dart';
import 'package:news_app/state/news_provider.dart';

class NewsListViewWidget extends StatefulWidget {
  const NewsListViewWidget({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewWidget> createState() => _NewsListViewWidgetState();
}

class _NewsListViewWidgetState extends State<NewsListViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsProvider>().loadCategory(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = context.watch<NewsProvider>();
    final bool loading = newsProvider.isLoading(widget.category);
    final String? error = newsProvider.errorFor(widget.category);
    final List<ArticlesModel> articles = newsProvider.articlesFor(widget.category);

    if (loading && articles.isEmpty) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: CircularProgressIndicator(color: Colors.amber),
          ),
        ),
      );
    }

    if (error != null && articles.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('oops there was an error, try latter'),
        ),
      );
    }

    return CustomNewsListView(articles: articles);
  }
}

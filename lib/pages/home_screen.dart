import 'package:flutter/material.dart';
import 'package:news_app/widget/NewsListViewWidget.dart';
import 'package:news_app/widget/custom_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomListView()),
          SliverToBoxAdapter(child: SizedBox(height: 32)),
          NewsListViewWidget(category: 'general'),
        ],
      ),
    );
  }
}

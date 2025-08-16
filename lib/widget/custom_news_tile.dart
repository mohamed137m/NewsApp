import 'package:flutter/material.dart';
import 'package:news_app/Model/articles_model.dart';
import 'package:news_app/pages/web_view.dart';
import 'package:news_app/widget/custom_title_text.dart';

class CustomNewsTile extends StatelessWidget {
  const CustomNewsTile({super.key, required this.articlesModel});
  final ArticlesModel articlesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MyWebView();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(10),
                child: Image.network(
                  articlesModel.imageUrl ??
                      'https://msftstories.thesourcemediaassets.com/sites/677/2024/09/COVER.png',
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomTitleText(
              titleName:
                  articlesModel.title ??
                  'Revolutionizing the Future: Artificial Intelligence',
              colorTitle: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            articlesModel.subTitle ??
                'Revolutionizing the Future: Artificial Intelligence Revolutionizing the Future: Artificial Intelligence Revolutionizing the Future: Artificial Intelligen ',
          ),
        ],
      ),
    );
  }
}

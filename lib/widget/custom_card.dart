import 'package:flutter/material.dart';
import 'package:news_app/Model/model_endpoints.dart';
import 'package:news_app/Model/model_card.dart';
import 'package:news_app/pages/category_view.dart';
import 'package:news_app/widget/custom_title_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.modelCard, required this.category,});
  final ModelCard modelCard;
  final  ModelEndpoints category; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: category.title ,);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 10),
        alignment: Alignment.center,
        width: 200,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(modelCard.imageCard),
          ),
        ),
        child: CustomTitleText(
          titleName: modelCard.titleCard,
          colorTitle: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/widget/custom_card.dart';
import 'package:news_app/widget/home_data_list.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: modelCardData.length,
        itemBuilder: (context, index) => CustomCard(
          modelCard: modelCardData[index],
          category: endpoints[index],
        ),
      ),
    );
  }
}

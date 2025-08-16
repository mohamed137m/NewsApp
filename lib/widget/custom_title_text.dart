import 'package:flutter/material.dart';

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    super.key,
    required this.titleName,
    required this.colorTitle, required this.fontSize,
  });
  final String titleName;
  final Color colorTitle;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleName,
      style: TextStyle(
        color: colorTitle,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

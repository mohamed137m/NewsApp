import 'package:flutter/material.dart';
import 'package:news_app/app/my_app.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/state/news_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          NewsProvider(NewsService(Dio()))..loadCategory('general'),
      child: MyApp(),
    ),
  );
}

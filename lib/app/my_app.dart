import 'package:flutter/material.dart';
import 'package:news_app/core/resources/routs_screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutsScreens.routes,
      initialRoute: NameRouts.homeScreen,
    );
  }
}

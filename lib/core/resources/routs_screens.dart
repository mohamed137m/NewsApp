import 'package:flutter/material.dart';
import 'package:news_app/pages/home_screen.dart';

class RoutsScreens {
  static Map<String, WidgetBuilder> routes = {
    NameRouts.homeScreen: (context) => HomeScreen(),
  };
}

class NameRouts {
  static String homeScreen = "kHomeScreen";
}

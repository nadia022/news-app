import 'package:flutter/material.dart';
import 'package:news_app/home/categories/categories.dart';
import 'package:news_app/home/category_details/category_details.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Categories(),
    );
  }
}

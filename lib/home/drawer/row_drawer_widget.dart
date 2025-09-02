import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';

class RowDrawerWidget extends StatelessWidget {
  String iconPath;
  String title;
  RowDrawerWidget({required this.iconPath, required this.title});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image.asset(iconPath),
        SizedBox(
          width: width * 0.02,
        ),
        Text(
          title,
          style: AppStyles.bold20White,
        )
      ],
    );
  }
}

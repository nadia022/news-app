import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class ThemeOrLocalWidget extends StatelessWidget {
  String title;

  ThemeOrLocalWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.019,
      ),
      height: height * 0.07,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.medium20White,
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            size: 40,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}

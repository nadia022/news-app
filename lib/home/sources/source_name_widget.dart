import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';

class SourceNameWidget extends StatelessWidget {
  bool isSelected;
  String sourceName;

  SourceNameWidget({required this.isSelected, required this.sourceName});
  @override
  Widget build(BuildContext context) {
    return Text(
      sourceName,
      //AppStyles.bold16White   //  AppStyles.medium14White,
      style: isSelected
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context).textTheme.titleMedium,
    );
  }
}

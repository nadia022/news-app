import 'package:flutter/material.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var appLocalization = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.02),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                themeProvider.setThemeMode(ThemeMode.dark);
              },
              child: themeProvider.appTheme == ThemeMode.dark
                  ? selectedItem(appLocalization.dark)
                  : unSelectedItem(appLocalization.dark)),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
              onTap: () {
                themeProvider.setThemeMode(ThemeMode.light);
              },
              child: themeProvider.appTheme == ThemeMode.light
                  ? selectedItem(appLocalization.light)
                  : unSelectedItem(appLocalization.light)),
        ],
      ),
    );
  }

  Widget selectedItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: AppStyles.medium20Blue,
        ),
        Spacer(),
        Icon(
          Icons.check,
          color: AppColors.blue,
        )
      ],
    );
  }

  Widget unSelectedItem(String text) {
    return Row(
      children: [
        Text(
          text,
          style: AppStyles.medium20Black,
        ),
        Spacer(),
        Icon(
          Icons.check,
          color: AppColors.grey,
        )
      ],
    );
  }
}

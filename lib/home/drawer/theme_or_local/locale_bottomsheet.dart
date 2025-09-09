import 'package:flutter/material.dart';
import 'package:news_app/providers/locale_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var localeProvider = Provider.of<LocaleProvider>(context);
    var appLocalization = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.02),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                localeProvider.changeLocale("en");
              },
              child: localeProvider.appLanguage == "en"
                  ? selectedItem(appLocalization!.english)
                  : unSelectedItem(appLocalization!.english)),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
              onTap: () {
                localeProvider.changeLocale("ar");
              },
              child: localeProvider.appLanguage == "ar"
                  ? selectedItem(appLocalization.arabic)
                  : unSelectedItem(appLocalization.arabic)),
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

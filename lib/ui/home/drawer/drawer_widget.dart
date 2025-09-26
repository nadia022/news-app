import 'package:flutter/material.dart';
import 'package:news_app/ui/home/drawer/row_drawer_widget.dart';
import 'package:news_app/ui/home/drawer/theme_or_local/locale_bottomsheet.dart';
import 'package:news_app/ui/home/drawer/theme_or_local/theme_bottomsheet.dart';
import 'package:news_app/ui/home/drawer/theme_or_local/theme_or_local_widget.dart';
import 'package:news_app/providers/locale_provider.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatefulWidget {
  Function? goToHomeClicked;
  DrawerWidget({this.goToHomeClicked});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var localeProvider = Provider.of<LocaleProvider>(context);
    var appLocalization = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          height: height * 0.25,
          decoration: BoxDecoration(color: AppColors.white),
          child: Center(
            child: Text(
              appLocalization.news_app,
              style: AppStyles.medium24Black,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.025,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.02, bottom: height * 0.02),
          child: InkWell(
            onTap: () {
              widget.goToHomeClicked!();
            },
            child: RowDrawerWidget(
                iconPath: AppAssets.homeIcon,
                title: appLocalization.go_to_home),
          ),
        ),
        Divider(
          color: AppColors.white,
          thickness: 1,
          indent: width * 0.02,
          endIndent: width * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.02, top: height * 0.02),
          child: RowDrawerWidget(
              iconPath: AppAssets.themeIcon, title: appLocalization.theme),
        ),
        ThemeOrLocalWidget(
          ThemeOrLocalFunction: showThemeBottomsheet,
          title: themeProvider.appTheme == ThemeMode.dark
              ? appLocalization.dark
              : appLocalization.light,
        ),
        Divider(
          color: AppColors.white,
          thickness: 1,
          indent: width * 0.02,
          endIndent: width * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.02, top: height * 0.02),
          child: RowDrawerWidget(
              iconPath: AppAssets.localIcon, title: appLocalization.language),
        ),
        ThemeOrLocalWidget(
          ThemeOrLocalFunction: showLocaleBottomsheet,
          title: localeProvider.appLanguage == "en"
              ? appLocalization.english
              : appLocalization.arabic,
        ),
      ],
    );
  }

  void showThemeBottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.33,
            color: AppColors.white,
            child: ThemeBottomsheet(),
          );
        });
  }

  void showLocaleBottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.33,
            color: AppColors.white,
            child: LocaleBottomsheet(),
          );
        });
  }
}

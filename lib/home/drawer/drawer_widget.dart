import 'package:flutter/material.dart';
import 'package:news_app/home/drawer/row_drawer_widget.dart';
import 'package:news_app/home/drawer/theme_or_local_widget.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerWidget extends StatelessWidget {
  Function? goToHomeClicked;

  DrawerWidget({this.goToHomeClicked});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          height: height * 0.25,
          decoration: BoxDecoration(color: AppColors.white),
          child: Center(
            child: Text(
              "News App",
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
              goToHomeClicked!();
            },
            child: RowDrawerWidget(
                iconPath: AppAssets.homeIcon, title: "Go To Home "),
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
          child: RowDrawerWidget(iconPath: AppAssets.themeIcon, title: "Theme"),
        ),
        ThemeOrLocalWidget(
          title: "Dark",
        ),
        Divider(
          color: AppColors.white,
          thickness: 1,
          indent: width * 0.02,
          endIndent: width * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.02, top: height * 0.02),
          child:
              RowDrawerWidget(iconPath: AppAssets.localIcon, title: "Language"),
        ),
        ThemeOrLocalWidget(
          title: "Light",
        ),
      ],
    );
  }
}

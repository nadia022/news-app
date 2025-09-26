import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categories/categories.dart';
import 'package:news_app/ui/home/sources/sources.dart';
import 'package:news_app/ui/home/drawer/drawer_widget.dart';
import 'package:news_app/ui/home/search/search_screen.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? appLocalization.home
              : selectedCategory!.catogryName,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.02),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
          backgroundColor: AppColors.black,
          child: DrawerWidget(
            goToHomeClicked: goToHomeClicked,
          )),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: selectedCategory == null
          ? Categories(
              onViewAllTap: getCategoryDetails,
            )
          : Sources(
              category: selectedCategory!,
            ),
    );
  }

  CategoryModel? selectedCategory;

  void getCategoryDetails(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void goToHomeClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

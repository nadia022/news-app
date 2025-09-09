import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<Articles> articles = [];

  int currentPage = 1;

  int maxResults = 0;
  String? errorMessage;

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        search();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.09,
              left: width * 0.03,
              right: width * 0.03,
            ),
            child: TextField(
              style: Theme.of(context).textTheme.labelMedium,
              onSubmitted: (value) {
                currentPage = 1;
                maxResults = 0;
                search();
              },
              controller: searchController,
              decoration: InputDecoration(
                  hintText: appLocalization.search,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close))),
            ),
          ),
          if (articles.isEmpty && errorMessage == null)
            Expanded(
              child: Center(
                  child: Lottie.asset("assets/animation/empty_animation.json")),
            )
          else if (errorMessage != null)
            Expanded(
              child: Center(
                child: Text(
                  errorMessage!,
                  style: AppStyles.bold16Red,
                ),
              ),
            )
          else
            Expanded(
                child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (index == articles.length) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.grey,
                    ),
                  );
                } else {
                  return NewsItem(article: articles[index]);
                }
              },
              itemCount: articles.length < maxResults
                  ? articles.length + 1
                  : articles.length,
            ))
        ],
      ),
    );
  }

  void search() async {
    try {
      var response = await ApiManager.searchForNews(
        searchController.text,
        currentPage,
      );
      articles.addAll(response.articles ?? []);
      maxResults = response.totalResults ?? 0;
      currentPage++;
    } catch (e) {
      errorMessage = e.toString();
    }
    setState(() {});
  }
}

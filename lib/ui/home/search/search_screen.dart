import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/cubits/search_cubit/search_states.dart';
import 'package:news_app/cubits/search_cubit/search_view_model.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  SearchViewModel searchViewModel = SearchViewModel();

  String? errorMessage;

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        searchViewModel.search(
            searchController.text, searchViewModel.currentPage);
      }
    });
  }

  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
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
                searchViewModel.currentPage = 1;
                searchViewModel.maxResult = 0;
                searchViewModel.search(
                    searchController.text, searchViewModel.currentPage);
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
          BlocProvider(
            create: (context) => searchViewModel,
            child: BlocBuilder<SearchViewModel, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState) {
                  final articles = state.articles;
                  return Expanded(
                    child: articles.isEmpty
                        ? Center(
                            child: Text("No data found...!",
                                style: Theme.of(context).textTheme.labelMedium),
                          )
                        : ListView.builder(
                            controller: scrollController,
                            padding: EdgeInsets.zero,
                            itemCount:
                                articles.length < searchViewModel.maxResult
                                    ? articles.length + 1
                                    : articles.length,
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
                            }),
                  );
                } else if (state is SearchErrorState) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          state.errorMessaage,
                          style: AppStyles.bold16Red,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              searchViewModel.search(searchController.text,
                                  searchViewModel.currentPage);
                            },
                            child: Text("Try Again"))
                      ],
                    ),
                  );
                } else if (state is SearchInitialState) {
                  return Expanded(
                    child: Center(
                      child:
                          Lottie.asset("assets/animation/empty_animation.json"),
                    ),
                  );
                }
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

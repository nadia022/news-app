import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  List<Articles> articles = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Icon(Icons.search)),
                  suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close))),
            ),
          ),
          Expanded(
            child: controller.text.isEmpty
                ? Center(
                    child: Icon(
                      Icons.hourglass_empty,
                      color: AppColors.black,
                      size: 80,
                    ),
                  )
                : FutureBuilder(
                    future: ApiManager.searchForNews(controller.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: AppColors.grey,
                        ));
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            children: [
                              Text("something went wrong."),
                              ElevatedButton(
                                  onPressed: () {
                                    ApiManager.searchForNews(controller.text);
                                    setState(() {});
                                  },
                                  child: Text("try again")),
                            ],
                          ),
                        );
                      }
                      if (snapshot.data!.status != "ok") {
                        return Center(
                          child: Column(
                            children: [
                              Text(snapshot.data!.message ?? ""),
                              ElevatedButton(
                                  onPressed: () {
                                    ApiManager.searchForNews(controller.text);
                                    setState(() {});
                                  },
                                  child: Text("try again")),
                            ],
                          ),
                        );
                      }
                      articles = snapshot.data!.articles ?? [];
                      return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return NewsItem(article: articles[index]);
                          });
                    }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/model/SourceResponse.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(widget.source.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text("something went wrong."),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNews(widget.source.id ?? "");
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
                        ApiManager.getNews(widget.source.id ?? "");
                        setState(() {});
                      },
                      child: Text("try again")),
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles ?? [];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsItem(article: newsList[index]);
              });
        });
  }
}

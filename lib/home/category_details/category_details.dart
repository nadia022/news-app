import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_details/source_tab_widget.dart';
import 'package:news_app/model/category_model.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Something went wrong"),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(widget.category.id);
                        setState(() {});
                      },
                      child: Text("Try Again"))
                ],
              ),
            );
          }
          if (snapshot.data!.status != "ok") {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text("Try Again"),
                  )
                ],
              ),
            );
          }
          var sourceList = snapshot.data!.sources ?? [];
          return SourceTabWidget(sources: sourceList);
        });
  }
}

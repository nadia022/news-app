import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/news_cubit/news_states.dart';
import 'package:news_app/cubits/news_cubit/news_view_model.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_styles.dart';

class NewsWidget extends StatelessWidget {
  Source source;

  NewsWidget({required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsState>(
      builder: (context, state) {
        if (state is SuccessNewsState) {
          return state.articles.isEmpty
              ? Center(
                  child: Text(
                    "Data not found...!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              : ListView.builder(
                  itemCount: state.articles.length,
                  itemBuilder: (context, index) {
                    return NewsItem(article: state.articles[index]);
                  },
                );
        } else if (state is ErrorNewsState) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.errorMessaage, style: AppStyles.bold16Red),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<NewsViewModel>()
                        .getNewsBySourceId(source.id ?? "");
                  },
                  child: const Text("try again"),
                ),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(color: AppColors.grey),
        );
      },
    );
  }
}

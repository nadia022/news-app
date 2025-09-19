import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/cubit/news_states.dart';
import 'package:news_app/home/news/cubit/news_view_model.dart';
import 'package:news_app/home/sources/source_name_widget.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/model/SourceResponse.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Source> sources;

  const SourceTabWidget({required this.sources, super.key});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  final NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    // اول ما يفتح يجيب اخبار السورس الاول
    newsViewModel.getNewsBySourceId(widget.sources[0].id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsViewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (context, state) {
          return DefaultTabController(
            length: widget.sources.length,
            initialIndex: newsViewModel.selectIndex,
            child: Column(
              children: [
                TabBar(
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Theme.of(context).indicatorColor,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  onTap: (value) {
                    newsViewModel.changIndex(value);
                    newsViewModel
                        .getNewsBySourceId(widget.sources[value].id ?? "");
                  },
                  tabs: widget.sources.map((source) {
                    return SourceNameWidget(
                      isSelected: newsViewModel.selectIndex ==
                          widget.sources.indexOf(source),
                      sourceName: source.name ?? "",
                    );
                  }).toList(),
                ),
                Expanded(
                  child: NewsWidget(
                    source: widget.sources[newsViewModel.selectIndex],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

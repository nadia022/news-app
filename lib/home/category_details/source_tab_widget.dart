import 'package:flutter/material.dart';
import 'package:news_app/home/category_details/source_name_widget.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sources;

  SourceTabWidget({required this.sources});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    // source[index].name==abs
    //[{des,name , id , cat},{des,name , id , cat},{des,name , id , cat} ]
    // abs , ahram  , aljaera , alaarabia
    //0    ,  1     ,  2     ,    3
    // TODO: implement build
    return DefaultTabController(
        length: widget.sources.length,
        initialIndex: selectIndex,
        child: Column(
          children: [
            TabBar(
                tabAlignment: TabAlignment.start,
                indicatorColor: Theme.of(context).indicatorColor,
                dividerColor: Colors.transparent,
                isScrollable: true,
                onTap: (value) {
                  selectIndex = value;
                  setState(() {});
                },
                tabs: widget.sources.map((source) {
                  return SourceNameWidget(
                      isSelected: selectIndex == widget.sources.indexOf(source),
                      sourceName: source.name ?? "");
                }).toList()),
            Expanded(child: NewsWidget(source: widget.sources[selectIndex]))
          ],
        ));
  }
}

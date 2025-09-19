import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/sources/cubit/souce_view_model.dart';
import 'package:news_app/home/sources/cubit/sources_states.dart';
import 'package:news_app/home/sources/source_tab_widget.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class Sources extends StatefulWidget {
  CategoryModel category;
  Sources({required this.category});

  @override
  State<Sources> createState() => _SourcesState();
}

class _SourcesState extends State<Sources> {
  SourceViewModel viewModel = SourceViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => viewModel,
      child:
          BlocBuilder<SourceViewModel, SourcesState>(builder: (context, state) {
        if (state is SuccessSourceState) {
          return SourceTabWidget(sources: state.sourcesList);
        } else if (state is ErrorSourceState) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorMessaage, style: AppStyles.bold16Red),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.category.id);
                      },
                      child: Text("Try Again"))
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.grey,
          ),
        );
      }),
    );

    // FutureBuilder(
    //     future: ApiManager.getSources(widget.category.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text("Something went wrong"),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     ApiManager.getSources(widget.category.id);
    //                     setState(() {});
    //                   },
    //                   child: Text("Try Again"))
    //             ],
    //           ),
    //         );
    //       }
    //       if (snapshot.data!.status != "ok") {
    //         return Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(snapshot.data!.message!),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getSources(widget.category.id);
    //                   setState(() {});
    //                 },
    //                 child: Text("Try Again"),
    //               )
    //             ],
    //           ),
    //         );
    //       }
    //       var sourceList = snapshot.data!.sources ?? [];
    //       return SourceTabWidget(sources: sourceList);
    //     });
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleBottomSheetDetails extends StatelessWidget {
  Articles articles;

  ArticleBottomSheetDetails({required this.articles});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.01),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                width: width * 0.96,
                height: height * 0.28,
                fit: BoxFit.fill,
                imageUrl: articles.urlToImage ?? "",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.grey,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
          SizedBox(
            height: height * 0.014,
          ),
          Expanded(
            child: Text(
              articles.content ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          FilledButton(
            onPressed: () {
              launchUrl(Uri.parse(articles.url ?? ""),
                  mode: LaunchMode.inAppWebView);
            },
            style: FilledButton.styleFrom(
                fixedSize: Size(width * 0.95, height * 0.07)),
            child: Text("View Full Article"),
          ),
          SizedBox(
            height: height * 0.016,
          ),
        ],
      ),
    );
  }
}

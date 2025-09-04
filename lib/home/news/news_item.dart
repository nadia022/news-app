import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/news/article_bottom_sheet_details.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        ShowArticleBottomSheet(context, article);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.018, vertical: height * 0.008),
        //h 340  w 361
        height: height * 0.34,
        width: width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).indicatorColor)),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  width: width * 0.9,
                  height: height * 0.22,
                  fit: BoxFit.fill,
                  imageUrl: article.urlToImage ?? "",
                  placeholder: (context, url) => Center(
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
            Text(
              article.title ?? "",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      article.author ?? "",
                      style: AppStyles.medium12Grey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    article.publishedAt ?? "",
                    style: AppStyles.medium12Grey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ShowArticleBottomSheet(BuildContext context, Articles articles) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ArticleBottomSheetDetails(
            articles: articles,
          );
        });
  }
}

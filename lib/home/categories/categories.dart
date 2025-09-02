import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';

class Categories extends StatelessWidget {
  List<CategoryModel> catogeries = CategoryModel.getCategories();
  Function onViewAllTap;
  Categories({required this.onViewAllTap});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.02,
                  );
                },
                itemCount: catogeries.length,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: index % 2 == 0
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          catogeries[index].imagePath,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          onViewAllTap(catogeries[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.02),
                          height: height * 0.05,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(24)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                "View All",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Spacer(),
                              Container(
                                width: width * 0.12,
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Theme.of(context).indicatorColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

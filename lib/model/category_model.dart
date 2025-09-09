import 'package:news_app/utils/app_assets.dart';

class CategoryModel {
  String id;
  String lightImagePath;
  String darkImagePath;

  String catogryName;

  CategoryModel(
      {required this.id,
      required this.lightImagePath,
      required this.catogryName,
      required this.darkImagePath});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "general",
          lightImagePath: AppAssets.generalImageLight,
          darkImagePath: AppAssets.generalImageDark,
          catogryName: "General"),
      CategoryModel(
          id: "business",
          lightImagePath: AppAssets.businessImageLight,
          darkImagePath: AppAssets.businessImageDark,
          catogryName: "Business"),
      CategoryModel(
          id: "sports",
          lightImagePath: AppAssets.sportsImageLight,
          darkImagePath: AppAssets.sportsImageDark,
          catogryName: "Sports"),
      CategoryModel(
          id: "health",
          lightImagePath: AppAssets.healthImageLight,
          darkImagePath: AppAssets.healthImageDark,
          catogryName: "Health"),
      CategoryModel(
          id: "entertainment",
          lightImagePath: AppAssets.entertainmentImageLight,
          darkImagePath: AppAssets.entertainmentImageDark,
          catogryName: "Entertainment"),
      CategoryModel(
          id: "technology",
          lightImagePath: AppAssets.technologyImageLight,
          darkImagePath: AppAssets.technologyImageDark,
          catogryName: "Technology"),
      CategoryModel(
          id: "science",
          lightImagePath: AppAssets.scienceImageLight,
          darkImagePath: AppAssets.scienceImageDark,
          catogryName: "Science"),
    ];
  }
}

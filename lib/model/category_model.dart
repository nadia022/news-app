import 'package:news_app/utils/app_assets.dart';

class CategoryModel {
  String id;
  String imagePath;
  String catogryName;
  CategoryModel(
      {required this.id, required this.imagePath, required this.catogryName});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "general",
          imagePath: AppAssets.generalImageDark,
          catogryName: "General"),
      CategoryModel(
          id: "business",
          imagePath: AppAssets.businessImageDark,
          catogryName: "Business"),
      CategoryModel(
          id: "sports",
          imagePath: AppAssets.sportsImageDark,
          catogryName: "Sports"),
      CategoryModel(
          id: "health",
          imagePath: AppAssets.healthImageDark,
          catogryName: "Health"),
      CategoryModel(
          id: "entertainment",
          imagePath: AppAssets.entertainmentImageDark,
          catogryName: "Entertainment"),
      CategoryModel(
          id: "technology",
          imagePath: AppAssets.technologyImageDark,
          catogryName: "Technology"),
      CategoryModel(
          id: "science",
          imagePath: AppAssets.scienceImageDark,
          catogryName: "Science"),
    ];
  }
}

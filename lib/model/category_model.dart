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
          imagePath: AppAssets.generalImageLight,
          catogryName: "General"),
      CategoryModel(
          id: "business",
          imagePath: AppAssets.businessImageLight,
          catogryName: "Business"),
      CategoryModel(
          id: "sports",
          imagePath: AppAssets.sportsImageLight,
          catogryName: "Sports"),
      CategoryModel(
          id: "health",
          imagePath: AppAssets.healthImageLight,
          catogryName: "Health"),
      CategoryModel(
          id: "entertainment",
          imagePath: AppAssets.entertainmentImageLight,
          catogryName: "Entertainment"),
      CategoryModel(
          id: "technology",
          imagePath: AppAssets.technologyImageLight,
          catogryName: "Technology"),
      CategoryModel(
          id: "science",
          imagePath: AppAssets.scienceImageLight,
          catogryName: "Science"),
    ];
  }
}

import 'package:news_app/model/NewsResponse.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  List<Articles> articles;
  int totalResults;
  SearchSuccessState({required this.articles, required this.totalResults});
}

class SearchErrorState extends SearchState {
  String errorMessaage;
  SearchErrorState({required this.errorMessaage});
}

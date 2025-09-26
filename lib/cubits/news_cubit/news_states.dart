import 'package:news_app/model/NewsResponse.dart';

abstract class NewsState {}

class ChangeSelectedIndexState extends NewsState {}

class LoadingNewsState extends NewsState {}

class SuccessNewsState extends NewsState {
  List<Articles> articles;
  SuccessNewsState({required this.articles});
}

class ErrorNewsState extends NewsState {
  String errorMessaage;
  ErrorNewsState({required this.errorMessaage});
}

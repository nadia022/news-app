import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/cubits/search_cubit/search_states.dart';
import 'package:news_app/model/NewsResponse.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchViewModel() : super(SearchInitialState());

  // hold data , handle logic

  int currentPage = 1;
  int maxResult = 0;
  List<Articles> allArticles = [];
  void getMoreResults(String searchQuery, int pageNumber) {}

  void search(String searchQuery, int pageNumber) async {
    try {
      if (currentPage == 1) {
        allArticles = [];
        emit(SearchLoadingState());
      }
      var response = await ApiManager.searchForNews(searchQuery, pageNumber);
      if (response.status == "ok") {
        if (pageNumber == 1) {
          allArticles = response.articles!;
        } else {
          allArticles.addAll(response.articles!);
        }
        maxResult = response.totalResults!;
        currentPage++;
        emit(
            SearchSuccessState(articles: allArticles, totalResults: maxResult));
      } else {
        emit(SearchErrorState(errorMessaage: response.message!));
      }
    } catch (e) {
      emit(SearchErrorState(errorMessaage: "Something went wrong..!"));
    }
  }
}

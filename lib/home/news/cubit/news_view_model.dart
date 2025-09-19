import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsViewModel() : super(LoadingNewsState());

  // hold data , handle logic
  int selectIndex = 0;
  void changIndex(int index) {
    selectIndex = index;
    emit(ChangeSelectedIndexState());
  }

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(LoadingNewsState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response.status == "ok") {
        emit(SuccessNewsState(articles: response.articles!));
      } else {
        emit(ErrorNewsState(errorMessaage: response.message!));
      }
    } catch (e) {
      emit(ErrorNewsState(errorMessaage: e.toString()));
    }
  }
}

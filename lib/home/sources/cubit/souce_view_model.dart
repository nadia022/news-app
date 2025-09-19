import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/sources/cubit/sources_states.dart';

class SourceViewModel extends Cubit<SourcesState> {
  SourceViewModel() : super(LoadingSourceState());

  // todo: hold data , handle logic
  // int selectIndex = 0;
  // void changIndex(int index, String sourceId) {
  //   selectIndex = index;
  //   getSources(sourceId);
  //   emit(ChangeSelectedIndexState());
  // }

  void getSources(String sourceId) async {
    try {
      emit(LoadingSourceState());
      var response = await ApiManager.getSources(sourceId);
      if (response?.status == "ok") {
        emit(SuccessSourceState(sourcesList: response!.sources!));
      } else {
        emit(ErrorSourceState(errorMessaage: response!.message!));
      }
    } catch (e) {
      emit(ErrorSourceState(errorMessaage: e.toString()));
    }
  }
}

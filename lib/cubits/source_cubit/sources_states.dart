import 'package:news_app/model/SourceResponse.dart';

abstract class SourcesState {}

// class ChangeSelectedIndexState extends SourcesState {}

class LoadingSourceState extends SourcesState {}

class SuccessSourceState extends SourcesState {
  List<Source> sourcesList;
  SuccessSourceState({required this.sourcesList});
}

class ErrorSourceState extends SourcesState {
  String errorMessaage;
  ErrorSourceState({required this.errorMessaage});
}

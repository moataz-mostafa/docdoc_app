import 'package:grade_project/features/home/recommendation/search/data/search_data_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<Data> doctors;

  SearchSuccessState({required this.doctors});
}

class SearchErrorState extends SearchState {
  final String errorMessage;

  SearchErrorState({required this.errorMessage});
}

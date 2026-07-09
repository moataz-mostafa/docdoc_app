
import '../data/home_data_model.dart';

class HomeState {}

class HomeInitialState extends HomeState{}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  List<Data> homeData;
  HomeSuccessState({required this.homeData});
}

class HomeErrorState extends HomeState {
  String errorMessage ;

  HomeErrorState ({required this.errorMessage});
}


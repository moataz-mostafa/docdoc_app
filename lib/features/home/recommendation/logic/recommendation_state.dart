import 'package:grade_project/features/home/data/home_data_model.dart';

class RecommendationState {}
class RecommendationInitialState extends RecommendationState{}
class RecommendationLoadingState extends RecommendationState{}
class RecommendationSuccessState extends RecommendationState{
  List<Data>recommendationData;
  RecommendationSuccessState({required this.recommendationData});
}

class RecommendationError extends RecommendationState {
  String errorMessage ;

  RecommendationError ({required this.errorMessage});
}
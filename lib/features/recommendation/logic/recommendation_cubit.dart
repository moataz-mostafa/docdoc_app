import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/features/home/data/home_data_model.dart';
import 'package:grade_project/features/recommendation/logic/recommendation_state.dart';

import '../../../core/const/api_const.dart';
import '../../../core/helper/cach_helper.dart';
import '../data/recommendation_data_Model.dart';

class RecommendationCubit extends Cubit<RecommendationState>{
  RecommendationCubit() : super(RecommendationInitialState());
  Dio dio = Dio();

  Future getRecommendationData() async {
    emit(RecommendationLoadingState());
    try {
      final token = CacheHelper.getToken();
      final response = await dio.get(
        ApiConst.home,
        options: Options(headers: {"Authorization": "Bearer$token"}),
      );
      if (response.statusCode == 200) {
        final data = HomeDataModel.fromJson(response.data);
        emit(RecommendationSuccessState(recommendationData: data.data!));
      }
    } catch (e) {
      emit(RecommendationError(errorMessage: e.toString()));
    }
  }
}

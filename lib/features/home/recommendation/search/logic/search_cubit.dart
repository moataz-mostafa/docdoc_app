import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/features/home/recommendation/search/logic/search_state.dart';

import '../../../../../core/const/api_const.dart';
import '../../../../../core/helper/cach_helper.dart';
import '../data/search_data_model.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  Dio dio = Dio();

  Future searchDoctors(String query) async {
    emit(SearchLoadingState());

    try {
      final token = CacheHelper.getToken();

      final response = await dio.get(
        "${ApiConst.search}?name=$query",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        final data = SearchDataModel.fromJson(response.data);
        emit(SearchSuccessState(doctors: data.data ?? []));
      }
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }
}

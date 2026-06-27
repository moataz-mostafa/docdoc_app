import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/const/api_const.dart';
import 'package:grade_project/core/helper/cach_helper.dart';
import 'package:grade_project/features/home/data/home_data_model.dart';
import 'package:grade_project/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  Dio dio = Dio();

  Future getHomeData() async {
    emit(HomeLoadingState());
    try {
      final token = CacheHelper.getToken();
      final response = await dio.get(
        ApiConst.home,
        options: Options(headers: {"Authorization": "Bearer$token"}),
      );
      if (response.statusCode == 200) {
        final data = HomeDataModel.fromJson(response.data);
        emit(HomeSuccessState(homeData: data.data!));
      }
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }
}

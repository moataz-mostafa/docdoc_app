import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/const/api_const.dart';
import 'package:grade_project/core/helper/cach_helper.dart';
import 'package:grade_project/features/home/Specialty/logic/specialty_state.dart';

import '../data/special_data.dart';

class SpecialtyCubit extends Cubit<SpecialtyState> {
  SpecialtyCubit() : super(SpecialtyInitialState());

  final Dio dio = Dio();

  Future<void> getSpecialList() async {
    emit(SpecialtyLoadingState());

    try {
      final token = CacheHelper.getToken();

      final response = await dio.get(
        ApiConst.specialList,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      if (response.statusCode == 200) {
        final SpecialListModel data =
        SpecialListModel.fromJson(response.data);

        emit(
          SpecialtySuccessState(
            specialList: data.data ?? [],
          ),
        );
      }
    } catch (e) {
      emit(
        SpecialtyErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
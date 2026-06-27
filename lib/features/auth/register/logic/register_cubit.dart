import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/const/api_const.dart';
import 'package:grade_project/core/helper/cach_helper.dart';
import 'package:grade_project/features/auth/register/data/aurh_response.dart';
import 'package:grade_project/features/auth/register/data/user_model.dart';
import 'package:grade_project/features/auth/register/logic/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  Dio dio = Dio();

  Future register(UserModel user) async {
    emit(RegisterLoadingState());
    try {
      final response = await dio.post(ApiConst.register, data: user.toJson()); //ده عبارة عن data attribute
      if (response.statusCode == 200) {
        final auth = AuthResponse.fromJson(response.data);
        //هستخدم ال savetoken
        await CacheHelper.saveToken(auth.data!.token!);
        emit(
          RegisterSuccessState(
            token: auth.data!.token!,
            userName: auth.data!.username!,
          ),
        );
      }
    } catch (e) {
      print("=======register error$e");
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}

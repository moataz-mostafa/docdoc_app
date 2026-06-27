import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/const/api_const.dart';
import 'package:grade_project/core/helper/cach_helper.dart';
import 'package:grade_project/features/auth/signIn/data/login_response.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  final Dio dio = Dio();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final response = await dio.post(
        ApiConst.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final auth = LoginResponse.fromJson(response.data);

        final String token = auth.data?.token ?? "";
        final String userName = auth.data?.username ?? "";

        emit(
          LoginSuccessState(
            userName: userName,
            token: token,
          ),
        );
      } else {
        emit(
          LoginErrorState(
            errorMessage: "Login failed",
          ),
        );
      }
    } on DioException catch (e) {
      emit(
        LoginErrorState(
          errorMessage: e.response?.data['message'] ??
              e.message ??
              "Something went wrong",
        ),
      );
    } catch (e) {
      emit(
        LoginErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
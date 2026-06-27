import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/features/home/logic/Home_cubit.dart';
import 'package:grade_project/features/home/logic/home_state.dart';

class DoctorSpecialityWidget extends StatelessWidget {
  const DoctorSpecialityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is HomeErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        if (state is HomeSuccessState) {
          return SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.homeData.length,
              itemBuilder: (context, index) {
                final speciality = state.homeData[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/Man Doctor Europe 1.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        speciality.name ?? "",
                        style: TxtStyle.font18wight600black,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
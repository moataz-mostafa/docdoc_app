import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/features/recommendation/logic/recommendation_cubit.dart';
import 'package:grade_project/features/recommendation/logic/recommendation_state.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<RecommendationCubit, RecommendationState>(
      builder: (context, state) {
        if (state is RecommendationLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is RecommendationError) {
          return Center(
            child: Text(state.errorMessage),
          );
        }

        if (state is RecommendationSuccessState) {
          final doctors = state.recommendationData
              .expand((speciality) => speciality.doctors ?? [])
              .toList();

          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];

              return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.18,
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/doctorlist.png',
                          height: screenHeight * 0.12,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                doctor.name ?? '',
                                style: TxtStyle.font18wight600black,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                doctor.degree ?? '',
                                style: TxtStyle.font14wight400grey,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                doctor.specialization?.name ?? '',
                                style: TxtStyle.font14wight400grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/features/home/logic/Home_cubit.dart';
import 'package:grade_project/features/home/logic/home_state.dart';

class DoctorsWidgets extends StatelessWidget {
  const DoctorsWidgets({super.key});

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
          final doctors = state.homeData
              .expand((speciality) => speciality.doctors ?? [])
              .toList();

          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/doctorlist.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name ?? "",
                            style: TxtStyle.font18wight600black,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            doctor.degree ?? "",
                            style: TxtStyle.font14wight400grey,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            doctor.specialization?.name ?? "",
                            style: TxtStyle.font14wight400grey,
                          ),
                        ],
                      ),
                    ),
                  ],
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
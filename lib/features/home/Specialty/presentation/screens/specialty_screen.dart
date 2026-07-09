import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/features/home/Specialty/logic/specialty_cubit.dart';
import 'package:grade_project/features/home/Specialty/logic/specialty_state.dart';

import '../../../../../core/widgets/back_arrow.dart';

class SpecialtyScreen extends StatelessWidget {
  const SpecialtyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpecialtyCubit()..getSpecialList(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SpecialtyCubit, SpecialtyState>(
            builder: (context, state) {
              if (state is SpecialtyLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is SpecialtyErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }

              if (state is SpecialtySuccessState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        spacing: 150,
                        children: [
                          BackArrow(
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text('Doctor Specialty',style: TxtStyle.font18wight600black,),

                        ],
                      ),
                      SizedBox(height: 18),

                      Expanded(
                        child: GridView.builder(
                          itemCount: state.specialList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: .8,
                          ),
                          itemBuilder: (context, index) {
                            final specialty = state.specialList[index];

                            return Column(
                              children: [
                                Image.asset(
                                  "assets/icons/Man Doctor Europe 1.png",
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  specialty.name ?? "",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
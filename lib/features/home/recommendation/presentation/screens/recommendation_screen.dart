import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/core/widgets/back_arrow.dart';
import '../../../../../core/widgets/custom_search_bar.dart';
import '../../logic/recommendation_cubit.dart';
import '../../search/logic/search_cubit.dart';
import '../../search/logic/search_state.dart';
import '../widgets/recommendation_widget.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RecommendationCubit()..getRecommendationData(),
        ),
        BlocProvider(
          create: (_) => SearchCubit(),
        ),
      ],
      // استخدام Builder هنا أساسي لإنشاء Context جديد يرى الـ Cubits الممررة بالأعلى
      child: Builder(
          builder: (innerContext) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  spacing: 20,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackArrow(),
                        Text(
                          'Recommendation Doctor',
                          style: TxtStyle.font18wight600black,
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ColorsManager.grey,
                              width: 1.2,
                            ),
                          ),
                          child: const Icon(
                            Icons.more_horiz,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // نستخدم الـ innerContext الجديد هنا لكي يرى الـ SearchCubit بنجاح
                    CustomSearchBar(
                      onSearch: (value) {
                        innerContext.read<SearchCubit>().searchDoctors(value);
                      },
                    ),

                    Expanded(
                      child: BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, searchState) {
                          if (searchState is SearchLoadingState) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          if (searchState is SearchSuccessState) {
                            final searchResults = searchState.doctors;
                            if (searchResults.isEmpty) {
                              return const Center(child: Text('No doctors found.'));
                            }

                            return ListView.builder(
                              itemCount: searchResults.length,
                              itemBuilder: (context, index) {
                                final doctor = searchResults[index];
                                return ListTile(
                                  leading: const CircleAvatar(child: Icon(Icons.person)),
                                  title: Text(doctor.name ?? 'Doctor'),
                                  subtitle: Text(doctor.specialization?.name ?? 'Specialty'),
                                );
                              },
                            );
                          }

                          if (searchState is SearchErrorState) {
                            return Center(child: Text('Error: ${searchState.errorMessage}'));
                          }

                          // الحالة الافتراضية إذا كان الحقل فارغاً
                          return const RecommendationWidget();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/core/widgets/back_arrow.dart';
import 'package:grade_project/features/recommendation/logic/recommendation_cubit.dart';

import '../../../../../core/widgets/custom_search_bar.dart';
import '../widgets/recommendation_widget.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecommendationCubit()..getRecommendationData(),
      child: Scaffold(
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
              const CustomSearchBar(),
              const Expanded(
                child: RecommendationWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
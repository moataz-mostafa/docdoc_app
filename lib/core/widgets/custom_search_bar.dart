import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/features/home/recommendation/search/logic/search_cubit.dart';
import '../utils/colors_manager.dart';
import '../utils/txt_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: ColorsManager.grey2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/search-normal.png',
                  color: ColorsManager.grey,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      context.read<SearchCubit>().searchDoctors(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 10),

        InkWell(
          onTap: () {},
          child: Image.asset('assets/icons/filter.png'),
        ),
      ],
    );
  }
}

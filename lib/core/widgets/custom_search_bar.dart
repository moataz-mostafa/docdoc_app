import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors_manager.dart';
import '../utils/txt_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              debugPrint('tap on');
            },
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
                  Text('Search', style: TxtStyle.font14wight400grey),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(onTap: () {}, child: Image.asset('assets/icons/filter.png')),
      ],
    );
  }
}

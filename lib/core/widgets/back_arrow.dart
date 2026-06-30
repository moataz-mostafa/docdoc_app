import 'package:flutter/material.dart';
import 'package:grade_project/core/utils/colors_manager.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorsManager.grey, width: 1.2),
      ),
      child: const Icon(Icons.arrow_back_ios_new, size: 24),
    );
  }
}

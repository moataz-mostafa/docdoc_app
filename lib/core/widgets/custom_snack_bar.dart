import 'package:flutter/material.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';

class CustomSnackBar {
  static SnackBar success(String message, BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle, color: ColorsManager.white),
          const SizedBox(width: 8),
          // Expanded يخلي النص ياخد المساحة المتاحة بشكل مرن
          Expanded(
            child: Text(
              message,
              style: TxtStyle.font16wight600White,
              overflow: TextOverflow.ellipsis, // لو النص طويل يتقص بشكل أنيق
              maxLines: 2, // يسمح بسطرين كحد أقصى
            ),
          ),
        ],
      ),
      backgroundColor: ColorsManager.primaryColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05, // نسبة من عرض الشاشة
        vertical: 12,
      ),
      duration: const Duration(seconds: 3),
    );
  }

  static SnackBar error(String message, BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error, color: ColorsManager.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: ColorsManager.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: 12,
      ),
      duration: const Duration(seconds: 3),
    );
  }
}

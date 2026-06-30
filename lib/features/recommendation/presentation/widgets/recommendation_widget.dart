import 'package:flutter/material.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الدكتور
            Image.asset(
              'assets/images/doctorlist.png',
              height: screenHeight *40,

            ),
            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Randy Wigham",
                    style: TxtStyle.font18wight600black,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "General | Degree",
                    style: TxtStyle.font14wight400grey,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Cardiology",
                    style: TxtStyle.font14wight400grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

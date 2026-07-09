import 'package:flutter/material.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';

class ContainorWidget extends StatelessWidget {
  const ContainorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.22,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorsManager.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Book and schedule\n with nearest doctor',
                        style:TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: ColorsManager.white ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: ColorsManager.primaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                            vertical: screenHeight * 0.015,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Find Nearby"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 0,
            top: -screenHeight * 0.03,
            child: Image.asset(
              'assets/images/homedoctor.png',
              width: screenWidth * 0.30,
              height: screenHeight * 0.25,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

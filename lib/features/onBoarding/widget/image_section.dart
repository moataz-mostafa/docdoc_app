import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Group.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Stack(
        children: [
          // صورة الدكتور
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/doctor.png',
              fit: BoxFit.contain,
            ),
          ),
          // طبقة الدمج (Gradient)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.0),
                  Colors.white.withOpacity(0.8),
                  Colors.white,
                ],
                stops: const [0.0, 0.5, 0.9, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

import 'onBoarding/screen/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // الخلفية
            Image.asset(
              "assets/images/Group.png",
              width: size.width * 1.0,
              fit: BoxFit.contain,
            ),

            // اللوجو + النص جنب بعض
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icons/Frame.png",
                  width: size.width * 0.15,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 12),
                const Text(
                  "Docdoc",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

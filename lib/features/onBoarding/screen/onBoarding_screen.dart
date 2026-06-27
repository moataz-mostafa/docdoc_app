import 'package:flutter/material.dart';
import 'package:grade_project/core/widgets/button_widget.dart';
import 'package:grade_project/features/auth/register/presentation/Screens/Register_screen.dart';

import '../../auth/signin/presentation/screens/login_screen.dart';
import '../widget/image_section.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(flex: 3, child: ImageSection()),

            // النصوص والزرار
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Best Doctor\nAppointment App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueAccent,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // استدعاء الزرار
                    ButtonWidget(
                      buttonTxt: 'Get Started',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

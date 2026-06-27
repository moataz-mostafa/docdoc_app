import 'package:flutter/material.dart';

class AuthFooterSection extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;
  final String divTxt;

  const AuthFooterSection({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
    required this.divTxt
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Divider
        Row(
          children: [
            Expanded(child: Divider()),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
               divTxt,
              ),
            ),

            Expanded(child: Divider()),
          ],
        ),

        SizedBox(height: 25),

        /// Social Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton("assets/icons/google.png"),
            SizedBox(width: 20),

            _socialButton("assets/icons/facebook.png"),
            SizedBox(width: 20),

            _socialButton("assets/icons/apple.png"),
          ],
        ),

        SizedBox(height: 25),

        /// Terms
        Text.rich(
          TextSpan(
            text: "By logging, you agree to our ",
            children: [
              TextSpan(
                text: "Terms & Conditions",
              ),
              TextSpan(
                text: " and Privacy Policy",
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 20),

        /// Bottom Text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),

            GestureDetector(
              onTap: onTap,
              child: Text(
                actionText,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(String image) {
    return Container(
      width: 55,
      height: 55,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: Image.asset(image),
    );
  }
}
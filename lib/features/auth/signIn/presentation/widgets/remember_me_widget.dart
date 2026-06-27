import 'package:flutter/material.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: true, // أو متغير من الـ Cubit
              onChanged: (value) {
              },
            ),
            Text("Remember Me"),
          ],
        ),
        GestureDetector(
          onTap: () {
// هنا تكتب الأكشن بتاع الـ Forget Password
          },
          child: Text(
            "Forget Password?",
            style: TextStyle(
              color: Colors.blue, // اللون الأزرق
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    )
      ;
  }
}



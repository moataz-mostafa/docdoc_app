import 'package:flutter/material.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';

class ButtonWidget extends StatelessWidget {
  String buttonTxt;
  Function onPressed;

  ButtonWidget({super.key, required this.buttonTxt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            color: ColorsManager.primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(buttonTxt, style: TxtStyle.font16wight600White),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';

class TxtFeild extends StatelessWidget {
  String hintText;
  TextEditingController textEditingController;
   TxtFeild({super.key, required this.hintText, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText ,
        hintStyle: TxtStyle.font14wight500grey,
        fillColor: ColorsManager.txtFeildfillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorsManager.txtFeildBorderColor)
        )
      ),
    );
  }
}

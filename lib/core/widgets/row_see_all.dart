import 'package:flutter/material.dart';
import 'package:grade_project/core/utils/txt_style.dart';
class RowSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback? onClick;

  const RowSeeAll({
    super.key,
    required this.title, this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TxtStyle.font18wight600black,
        ),
        InkWell(
          onTap: onClick,
          child: Text(
            "See All",
            style: TxtStyle.font12wight300blue,
          ),
        ),
      ],
    );
  }
}
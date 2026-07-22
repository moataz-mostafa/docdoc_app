import 'dart:async';
import 'package:flutter/material.dart';
// الاستيراد الصحيح للـ utils بناءً على ملف الـ button المفتوح أمامك
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearch; // استقبال دالة البحث من الخارج

  const CustomSearchBar({super.key, required this.onSearch});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(query); // استدعاء الدالة الممررة بعد انتهاء الكتابة بـ 500ms
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: ColorsManager.grey2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/search-normal.png',
                  color: ColorsManager.grey,
                  height: 22,
                  width: 22,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: TxtStyle.font18wight600black,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: _onSearchChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('assets/icons/filter.png'),
          ),
        ),
      ],
    );
  }
}

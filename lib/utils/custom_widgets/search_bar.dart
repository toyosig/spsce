import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SimpleSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmit;
  final TextEditingController controller;
  final String hintText;

  const SimpleSearchBar({
    super.key,
    required this.onChanged,
    required this.onSubmit,
    required this.controller,
    this.hintText = 'Search for anything',
  });

  @override
  State<SimpleSearchBar> createState() => _SimpleSearchBarState();
}

class _SimpleSearchBarState extends State<SimpleSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.userInActive,
        borderRadius: BorderRadius.circular(40.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Icon(Icons.search_rounded, color: Colors.black54, size: 23.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmit,
              controller: widget.controller,
              style: const TextStyle(color: Colors.black87),  
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintMaxLines: 1,
                hintStyle: AppTextStyles.poppins(
                  color: Colors.black54,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

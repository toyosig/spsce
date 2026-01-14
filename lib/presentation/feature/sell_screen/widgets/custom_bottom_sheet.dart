import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatefulWidget {
  final String title;
  final Widget child;
  // final VoidCallback onClose;
  // final bool isSubCategory;
  final IconButton? leadingIcon;
  const CustomBottomSheet({
    super.key,
    required this.title,
     this.leadingIcon,
    required this.child,
    // required this.onClose,
    // required this.isSubCategory,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.leadingIcon??const SizedBox(),
              //  ??
              //     IconButton(
              //       icon: const Icon(Icons.close),
              //       onPressed: widget.onClose,
              //     ),
              Text(
                widget.title,
                style: AppTextStyles.neueMontreal(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          const Divider(),
          widget.child,
        ],
      ),
    );
  }
}

import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagsWidget extends StatelessWidget {
  final List<String>? tagList;
  const TagsWidget({super.key, this.tagList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.sp, vertical: 4.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              color: AppColors.lightgreyshade,
            ),
            child: Icon(Icons.sell_outlined, color: Colors.grey, size: 13.sp),
          ),
          5.horizontalSpace,
          Expanded(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: tagList!
                  .map(
                    (e) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.sp,
                        vertical: 4.sp,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
                        color: AppColors.lightgreyshade,
                      ),
                      child: Text(
                        e.trim().startsWith('#') ? e.trim() : '#${e.trim()}',
                        style: AppTextStyles.neueMontreal(
                          color: AppColors.primaryBlack.withValues(alpha: 0.6),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

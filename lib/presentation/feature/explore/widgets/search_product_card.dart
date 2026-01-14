import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchProductCard extends StatelessWidget {
  final String imageUrl;
  final String size;
  final String price;

  const SearchProductCard({
    super.key,
    required this.imageUrl,
    required this.size,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(2.r)),
            child: AspectRatio(
              aspectRatio: 163.w / 176.h,
              child: NetworkImageHelper(
                imagePath: imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 8.h),
            child: Column(
              spacing: 6.h,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: AppTextStyles.neueMontreal(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                if (size.startsWith('null') == false)
                  Text(
                    size,
                    style: AppTextStyles.neueMontreal(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:circ/utils/custom_widgets/network_image_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImagesColumn extends StatelessWidget {
  final String? photos;
  const ProductImagesColumn({super.key, this.photos});

  @override
  Widget build(BuildContext context) {
    
    return NetworkImageHelper(
          imagePath: photos ?? '',
          fit: BoxFit.cover,
          width: 80.sp,
          height: 80.sp,
        );
     
  }
}

import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceSliderCard extends StatefulWidget {
  final double value;
  final Function(double) onChanged;

  const PriceSliderCard({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<PriceSliderCard> createState() => _PriceSliderCardState();
}

class _PriceSliderCardState extends State<PriceSliderCard> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Range (Maxium Price to Pay)',
            style: AppTextStyles.neueMontreal(
              color: AppColors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₦${_currentValue.round()}',
                style: AppTextStyles.neueMontreal(
                  color: AppColors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '₦50,000',
                style: AppTextStyles.neueMontreal(
                  color: AppColors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4.h,
              activeTrackColor: const Color(0xFFE6E6E6),
              inactiveTrackColor: const Color(0xFFE6E6E6),
              thumbColor: Colors.black,
              overlayColor: Colors.transparent,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
              trackShape: const RoundedRectSliderTrackShape(),
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              min: 0,
              max: 50000,
              divisions: 100,
              value: _currentValue,
              label: '₦${_currentValue.round()}',
              onChanged: (value) {
                setState(() => _currentValue = value);
                widget.onChanged(value); // Notify parent
              },
            ),
          ),
        ],
      ),
    );
  }
}

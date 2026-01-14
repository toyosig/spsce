import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ColorSelectorTile extends StatefulWidget {
  final String label;
  final Color initialColor;
  final ValueChanged<Color> onColorChanged;
  final VoidCallback? onTap;
  final String? title;

  const ColorSelectorTile({
    super.key,
    required this.label,
    required this.initialColor,
    this.onTap,
    required this.onColorChanged,
    this.title,
  });

  @override
  State<ColorSelectorTile> createState() => _ColorSelectorTileState();
}

class _ColorSelectorTileState extends State<ColorSelectorTile> {
  @override
  Widget build(BuildContext context) {
    final sellVm = context.watch<SellViewModel>();
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title ?? 'Colors',
            style: AppTextStyles.neueMontreal(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Container(
            padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 18.h),
            margin: const EdgeInsets.symmetric(vertical: 0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: AppTextStyles.neueMontreal(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                Row(
                  children: sellVm.selectedColors.map((colorName) {
                    final color = Formators().colorFromNameInsensitive(
                      colorName,
                    );
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: color,
                        child: colorName == "White"
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              )
                            : null,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

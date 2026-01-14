import 'package:circ/core/constant/global.dart';
import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectConditionSheet extends StatefulWidget {
  const SelectConditionSheet({super.key});

  @override
  State<SelectConditionSheet> createState() => _SelectConditionSheetState();
}

class _SelectConditionSheetState extends State<SelectConditionSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<SellViewModel>(
        builder: (context, sellVm, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: conditions.map((condition) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xffF5FAFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                    sellVm.selectedCondition?.title == condition.title
                        ? Colors.pink
                        : const Color(0xFFE0E0E0),
                    width: 1,
                  ),

                ),
                child: RadioListTile<ConditionOptions>(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  value: condition,
                  groupValue: sellVm.selectedCondition,
                  onChanged: (ConditionOptions? v) {
                    if (v != null) {
                      sellVm.setSelectedCondition(v);
                      Navigator.pop(context);
                    }
                  },
                  activeColor: AppColors.primaryColor,
                  title: Text(
                    condition.title ?? '',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  subtitle: Text(
                    condition.subtitle ?? '',
                    style: AppTextStyles.neueMontreal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

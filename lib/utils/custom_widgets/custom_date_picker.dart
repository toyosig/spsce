import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerHelper {
  Future<DateTime?> showReusableDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    TextEditingController? controller,
    void Function(DateTime)? onDateSelected,
  }) async {
    final DateTime? pickedDate = await showDatePickerDialog(
      context: context,
      minDate: DateTime(1950, 1, 1),
      maxDate: DateTime(2050, 1, 1),
      centerLeadingDate: true,
      daysOfTheWeekTextStyle: AppTextStyles.poppins(
        color: AppColors.greyText,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      currentDateTextStyle: AppTextStyles.poppins(
        color: AppColors.btnTextblack,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      leadingDateTextStyle: AppTextStyles.poppins(
        color: AppColors.primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      selectedCellDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
      ),
      selectedCellTextStyle: AppTextStyles.poppins(
        color: AppColors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      disabledCellsTextStyle: AppTextStyles.poppins(
        color: AppColors.btnTextblack,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      enabledCellsTextStyle: AppTextStyles.poppins(
        color: AppColors.btnTextblack,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      slidersColor: AppColors.primaryColor,
      splashColor: AppColors.white,
      currentDateDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor.withAlpha((255 * 0.2).toInt()),
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
    );

    if (pickedDate != null) {
      if (controller != null) {
        controller.text = Formators.dateFormater(
          pickedDate,
          format: 'dd/MM/yyyy',
        );
        onDateSelected?.call(pickedDate);
      }
      if (onDateSelected != null) {
        onDateSelected(pickedDate);
      }
    }
    return pickedDate;
  }
}

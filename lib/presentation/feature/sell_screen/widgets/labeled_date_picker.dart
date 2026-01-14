import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LabeledDatePicker extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isTitleVisible;
  final double? width;
  final double? height;
  final String? Function(String?)? validator;
  final ValueChanged<DateTime>? onDateSelected;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String dateFormat;
  final bool enablePastDates;
  final bool enableFutureDates;

  const LabeledDatePicker({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.isTitleVisible,
    this.width,
    this.height,
    this.validator,
    this.onDateSelected,
    this.onChanged,
    this.focusNode,
    this.nextFocusNode,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat = 'MMM dd, yyyy',
    this.enablePastDates = true,
    this.enableFutureDates = true,
  });

  @override
  State<LabeledDatePicker> createState() => _LabeledDatePickerState();
}

class _LabeledDatePickerState extends State<LabeledDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.controller.text.isNotEmpty) {
      try {
        selectedDate = DateFormat(
          widget.dateFormat,
        ).parse(widget.controller.text);
      } catch (e) {
        // Handle parsing error if needed
      }
    }
  }

  String? Function(String?) getDefaultValidator() {
    if (widget.label.toLowerCase().contains('date') ||
        widget.label.toLowerCase().contains('birth') ||
        widget.label.toLowerCase().contains('expiry')) {
      return FormValidators.validateRequired;
    } else {
      return FormValidators.validateRequired;
    }
  }

  DateTime get _firstDate {
    if (widget.firstDate != null) return widget.firstDate!;

    if (!widget.enablePastDates) {
      return DateTime.now();
    }

    return DateTime(1900);
  }

  DateTime get _lastDate {
    if (widget.lastDate != null) return widget.lastDate!;

    if (!widget.enableFutureDates) {
      return DateTime.now();
    }

    return DateTime(2100);
  }

  DateTime get _initialDate {
    if (widget.initialDate != null) return widget.initialDate!;

    final now = DateTime.now();

    // Ensure initial date is within bounds
    if (now.isBefore(_firstDate)) return _firstDate;
    if (now.isAfter(_lastDate)) return _lastDate;

    return now;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? _initialDate,
      firstDate: _firstDate,
      lastDate: _lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.black,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat(widget.dateFormat).format(picked);
      });

      // Call callbacks
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
      if (widget.onChanged != null) {
        widget.onChanged!(widget.controller.text);
      }

      // Handle focus navigation
      if (context.mounted && widget.nextFocusNode != null) {
        FocusScope.of(context).requestFocus(widget.nextFocusNode);
      } else {
        if (context.mounted) FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitleVisible
            ? Text(
                widget.label,
                style: AppTextStyles.neueMontreal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              )
            : const SizedBox(),
        SizedBox(height: 6.h),
        SizedBox(
          width: widget.width ?? double.infinity,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator ?? getDefaultValidator(),
            style: AppTextStyles.neueMontreal(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            focusNode: widget.focusNode,
            readOnly: true,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              hintText: widget.hintText,
              hintStyle: AppTextStyles.neueMontreal(
                color: AppColors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Icon(
                Icons.calendar_today,
                color: AppColors.grey,
                size: 20.sp,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

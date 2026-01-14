import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationToggleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationToggleTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          contentPadding: const EdgeInsets.only(right: 0, left: 7),
          leading: Image.asset(
            'assets/images/notification_icon.png',
            width: 20.w,
            height: 20.h,
          ),
          title: Text(
            title,
            style: AppTextStyles.neueMontreal(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyles.neueMontreal(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
              fontSize: 12.sp,
            ),
          ),
          trailing: Transform.scale(
            scale: 0.75,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: AppColors.primaryColor,
              activeTrackColor: AppColors.primaryColor,
              inactiveTrackColor: AppColors.black,
              thumbColor: WidgetStateProperty.all(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

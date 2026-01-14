import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawalConfirmationScreen extends StatelessWidget {
  const WithdrawalConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.sp),
          child: Column(
            spacing: 16.h,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Icon(Icons.check_circle, color: Colors.green, size: 80.sp),
              Text(
                'Withdrawal Request Received',
                style: AppTextStyles.neueMontreal(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'We have received your withdrawal request and will process it shortly.',
                style: AppTextStyles.neueMontreal(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomAppButtons.primaryButton(
                text: 'Done',
                width: double.infinity,
                alignment: Alignment.topRight,
                onTap: () {
                  context.go('/navbar', extra: 4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

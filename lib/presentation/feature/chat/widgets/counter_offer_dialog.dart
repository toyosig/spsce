import 'package:circ/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// This widget expects onCancel to be a synchronous VoidCallback, not a Future or nullable.
// If you see a linter error, ensure you are passing a synchronous function for onCancel.
class CounterOfferDialog extends StatefulWidget {
  final int oldOfferPrice;
  final TextEditingController counterOfferController;
  final VoidCallback onCancel;
  final Future<void> Function(String counterOffer) onSubmit;

  const CounterOfferDialog({
    super.key,
    required this.oldOfferPrice,
    required this.counterOfferController,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  State<CounterOfferDialog> createState() => _CounterOfferDialogState();
}

class _CounterOfferDialogState extends State<CounterOfferDialog> {
  bool _isSubmitting = false;

  void _handleSubmit() async {
    if (_isSubmitting) return;
    final counterOffer = widget.counterOfferController.text.trim();
    if (counterOffer.isEmpty) return;
    setState(() => _isSubmitting = true);
    await widget.onSubmit(counterOffer);
    if (!mounted) return;
    setState(() => _isSubmitting = false);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Counter Offer',
              style: AppTextStyles.poppins(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            5.verticalSpace,
            Text(
              'Send a new offer as a response',
              style: AppTextStyles.poppins(
                color: Colors.black38,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Container(
                padding: EdgeInsets.all(15.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Counter Offer: ",
                      style: AppTextStyles.neueMontreal(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Previous Offer:",
                              style: AppTextStyles.neueMontreal(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              Formators.formatCurrency(widget.oldOfferPrice),
                              style: AppTextStyles.neueMontreal(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    LabelTextField(
                      textInputType: TextInputType.number,
                      label: "Counter Offer",
                      hintText: "Enter your counter offer",
                      controller: widget.counterOfferController,
                      maxLines: 2,
                      isTitleVisible: true,
                    ),
                  ],
                ),
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.only(right: 20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSubmitting ? null : widget.onCancel,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                  10.horizontalSpace,
                  CustomAppButtons.primaryButton(
                    text: _isSubmitting ? "Submitting..." : "Submit",
                    onTap: _handleSubmit,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

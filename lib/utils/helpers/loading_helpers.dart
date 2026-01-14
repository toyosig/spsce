import 'package:circ/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingHelper {
  static bool _isDialogShowing = false;

  static void showLoading(BuildContext context) {
    if (_isDialogShowing) return;

    _isDialogShowing = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withAlpha((255 * 0.3).toInt()),
      builder: (_) => PopScope(
        canPop: false,
        child: UnconstrainedBox(
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(
                padding: EdgeInsets.all(10),
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    if (_isDialogShowing) {
      if (!context.mounted) return;
      Navigator.of(context, rootNavigator: true).pop();
      _isDialogShowing = false;
    }
  }
}

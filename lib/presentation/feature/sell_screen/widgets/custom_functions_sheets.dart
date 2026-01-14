import 'package:circ/presentation/feature/sell_screen/view_model/sell_view_model.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/custom_bottom_sheet.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomSheetHelper {
  void showCategoryBottomSheet({
    required BuildContext context,
    required Widget child,
    required String title,
    bool isSubCategory = true,
  }) {
    final vm = Provider.of<SellViewModel>(context, listen: false);
    vm.reset();
    vm.setCurrentPage(0);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Consumer<SellViewModel>(
          builder: (context, vm, _) {
            return CustomBottomSheet(
              title: title,
              leadingIcon: IconButton(
                icon: Icon(
                  vm.currentLevel > 0 ? Icons.arrow_back_ios : Icons.close,
                ),
                onPressed: () {
                  if (vm.currentLevel > 0) {
                    vm.goBack();
                  } else {
                    vm.reset();
                    Navigator.pop(context);
                  }
                },
              ),
              child: child,
            );
          },
        );
      },
    );
  }

  void showBottomSheet({
    required BuildContext context,
    required Widget child,
    required String title,
    bool isSubCategory = true,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select $title',
                style: AppTextStyles.neueMontreal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 12),
              child,
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

import 'package:circ/data/models/home/products_data.dart';
import 'package:circ/presentation/feature/auth/widgets/custom_text_field.dart';
import 'package:circ/utils/constants/app_buttons.dart';
import 'package:circ/utils/constants/app_colors.dart';
import 'package:circ/utils/custom_widgets/formators.dart';
import 'package:circ/utils/custom_widgets/text_styles.dart';
import 'package:circ/utils/helpers/dialog_box.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class DetailsViewModel extends ChangeNotifier {
  static void showSellerProductOptions({
    required ProductsData product,
    required BuildContext context,
    required VoidCallback onEdit,
    required VoidCallback onRemove,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.black,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onEdit();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/edit_icon.png',
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        product.isDraft == true
                            ? "Publish Listing"
                            : "Edit Listing",
                        style: AppTextStyles.neueMontreal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.verticalSpace,
              Container(
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.lightred.withValues(alpha: 0.2),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onRemove();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/remove_icon.png',
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Remove',
                        style: AppTextStyles.neueMontreal(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showRemoveProductDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withAlpha((255 * 0.5).toInt()),
      builder: (context) => CustomConfirmationDialog(
        image: 'assets/images/remove.png',
        title: "Product Removed",
        message: "your product removed\n from our marketplace",
        btnText: "Remove",
        onremove: () {
          Navigator.of(context).pop();
          onConfirm();
        },
      ),
    );
  }

  static void showPriceInputDialog(
    BuildContext context, {
    required int price,
    required Function(String price) onSubmit,
  }) {
    final TextEditingController priceController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 13,
            children: [
              Text(
                'Price it',
                style: AppTextStyles.neueMontreal(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                'Make an offer below the listing price',
                style: AppTextStyles.neueMontreal(
                  color: AppColors.lightblack.withValues(alpha: 0.7),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Seller price ${Formators.formatCurrency(price)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greenPrice,
                ),
              ),
              LabelTextField(
                textInputType: TextInputType.number,
                label: "Your Current- Offer",
                hintText: " ${Formators.formatCurrency(price)}",
                controller: priceController,
                maxLines: 1,
                isTitleVisible: true,
              ),

              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAppButtons.primaryButton(
                      width: 137.w,
                      text: "Cancel",
                      textColor: AppColors.black,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor: Colors.transparent,
                      boarderSideColor: AppColors.black,
                      borderRadius: 8,
                    ),
                    SizedBox(width: 10),
                    CustomAppButtons.primaryButton(
                      width: 137.w,
                      text: "Submit",
                      onTap: () {
                        Navigator.of(context).pop();
                        final price = priceController.text.trim();
                        if (price.isEmpty) {
                          MessageHelper.showErrorMessage(
                            context,
                            'Please enter price',
                          );
                          return;
                        }
                        onSubmit(price);
                      },
                      borderRadius: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
          //   ],
          // ),
        ),
      ),
    );
  }

  // --- UI State for Product Detail Media ---
  bool isPlaying = false;
  bool isLiked = false;

  void togglePlayPause(VideoPlayerController controller) {
    isPlaying = !isPlaying;
    isPlaying ? controller.play() : controller.pause();
    notifyListeners();
  }

  void setPlaying(bool value) {
    isPlaying = value;
    notifyListeners();
  }

  void toggleLike() {
    isLiked = !isLiked;
    notifyListeners();
  }

  void setLiked(bool value) {
    isLiked = value;
    notifyListeners();
  }
}
